//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Andrij Trubchanin on 11/10/16.
//  Copyright © 2016 Andrij Trubchanin. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    // MARK: FoodTracker Tests
    
    func testCompanyInit() {
        let potentialItem = Company(name: "Onlinico", photo: nil, rating: 5)
        XCTAssertNotNil(potentialItem)

        let noName = Company(name: "", photo: nil, rating: 0)
        XCTAssertNil(noName, "Empty name is invalid")
        
        let badRating = Company(name: "Really bad rating", photo: nil, rating: -1)
        XCTAssertNil(badRating, "Rating cant be nagative")
    }
}
