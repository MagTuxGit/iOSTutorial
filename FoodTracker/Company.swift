//
//  Company.swift
//  FoodTracker
//
//  Created by Andrij Trubchanin on 11/22/16.
//  Copyright © 2016 Andrij Trubchanin. All rights reserved.
//

import UIKit

class Company {
    // MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    // MARK: Initialization
    
    init?(name: String, photo: UIImage?, rating: Int) {
        self.name = name
        self.photo = photo
        self.rating = rating
        
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
}
