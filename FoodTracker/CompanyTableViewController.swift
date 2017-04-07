//
//  CompanyTableViewController.swift
//  FoodTracker
//
//  Created by Andrij Trubchanin on 11/22/16.
//  Copyright © 2016 Andrij Trubchanin. All rights reserved.
//

import UIKit

class CompanyTableViewController: UITableViewController {
    
    // MARK : Properties
    
    var companies = [Company]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        if let savedCompanies = loadCompanies() {
            companies += savedCompanies
        } else {
            loadSampleCompanies()
        }
    }
    
    func loadSampleCompanies() {
        let photo1 = UIImage(named: "onlinico")!
        let comp1 = Company(name: "Onlinico", photo: photo1, rating: 5)!
        
        let photo2 = UIImage(named: "altexsoft")!
        let comp2 = Company(name: "Altexsoft", photo: photo2, rating: 5)!
        
        let photo3 = UIImage(named: "riversoft")!
        let comp3 = Company(name: "Riversoft", photo: photo3, rating: 3)!

        let photo4 = UIImage(named: "madappgang")!
        let comp4 = Company(name: "MadAppGang", photo: photo4, rating: 4)!

        let photo5 = UIImage(named: "jomedia")!
        let comp5 = Company(name: "Jomedia", photo: photo5, rating: 4)!

        let photo6 = UIImage(named: "stickypassword")!
        let comp6 = Company(name: "Sticky Password", photo: photo6, rating: 4)!

        let photo7 = UIImage(named: "telefum")!
        let comp7 = Company(name: "Telefum", photo: photo7, rating: 2)!
        
        companies += [comp1, comp2, comp3, comp4, comp5, comp6, comp7]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of rows
        return companies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CompanyTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CompanyTableViewCell

        // Configure the cell...
        let comp = companies[indexPath.row]
        cell.nameLabel.text = comp.name
        cell.photoImageView.image = comp.photo
        cell.ratingControl.rating = comp.rating
        
        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            companies.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        saveCompanies()
    }

    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedObject = companies[fromIndexPath.row]
        companies.remove(at: fromIndexPath.row)
        companies.insert(movedObject, at: to.row)
        //NSLog("%@", "\(fromIndexPath.row) => \(to.row) \(companies)")
        saveCompanies()
    }

    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier=="AddItem" {
            
        } else
        if segue.identifier=="ShowDetail" {
            let companyViewController = segue.destination as! CompanyViewController
            if let selectedCell = sender as? CompanyTableViewCell {
                let indexPath = tableView.indexPath(for: selectedCell)!
                companyViewController.company = companies[indexPath.row]
            }
        }
    }

    @IBAction func unwindToCompanyList(sender: UIStoryboardSegue) {
        // sender.source is UIViewController
        if let sourceViewController = sender.source as? CompanyViewController, let company = sourceViewController.company {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                companies[selectedIndexPath.row] = company
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                // get index of new item in table view
                let newIndexPath = IndexPath(row: companies.count, section: 0)
                companies.append(company)
                tableView.insertRows(at: [newIndexPath], with: .bottom)
            }
            saveCompanies()
        }
    }
    
    // MARK: NSCoding
    
    func saveCompanies() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(companies, toFile: Company.archiveURL.path)
        if !isSuccessfulSave {
            print("Failed to save companies...")
        }
    }
    
    func loadCompanies() -> [Company]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Company.archiveURL.path) as? [Company]
    }
    
    
}
