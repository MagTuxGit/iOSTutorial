//
//  CompanyTableViewCell.swift
//  FoodTracker
//
//  Created by Andrij Trubchanin on 11/22/16.
//  Copyright © 2016 Andrij Trubchanin. All rights reserved.
//

import UIKit

class CompanyTableViewCell: UITableViewCell {
    
    // MARK : Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
