//
//  DAO.swift
//  moovelCodeChalenge
//
//  Created by Chad Wiedemann on 4/5/17.
//  Copyright © 2017 Chad Wiedemann LLC. All rights reserved.
//

import UIKit

class DAO: NSObject {

    static let sharedInstance = DAO()
    var riders: Array<Rider>  = []
    
    func readData() {
        if let path = Bundle.main.path(forResource: "riderData", ofType: "json") {
            do {
                let jsonData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                do {
                    let jsonResult: NSDictionary = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    create(data: jsonResult)
                } catch {
                    print(error.localizedDescription)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func create(data: NSDictionary) {
        Rider.init(type: ", subtext: <#T##String#>, fares: <#T##Array<Fare>#>)
    }
    
    
    
}
