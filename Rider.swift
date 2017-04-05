//
//  Rider.swift
//  moovelCodeChalenge
//
//  Created by Chad Wiedemann on 4/5/17.
//  Copyright © 2017 Chad Wiedemann LLC. All rights reserved.
//

import UIKit

class Rider: NSObject {

    var type: String!
    var subtext: String?
    var fares: Array<Fare>
    
    
    init(type: String, subtext: String, fares: Array<Fare>){
        self.type = type
        self.subtext = subtext
        self.fares = fares
    
    }
    
    
}
