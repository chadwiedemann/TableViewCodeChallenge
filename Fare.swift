//
//  Fare.swift
//  moovelCodeChalenge
//
//  Created by Chad Wiedemann on 4/5/17.
//  Copyright © 2017 Chad Wiedemann LLC. All rights reserved.
//

import UIKit

class Fare: NSObject {
    
    var fareDescription: String!
    var price: Double!
    
    
    init(description: String, price: Double) {
        self.fareDescription = description
        self.price = price
    }
}
