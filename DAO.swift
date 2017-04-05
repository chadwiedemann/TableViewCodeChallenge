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
        let keys: Array<String> = data.allKeys as! Array<String>
        for element in keys {
            let currentDictionary: NSDictionary = data.value(forKey: element) as! NSDictionary
            let newRider = Rider.init(type: element, subtext: self.createSubtext(dict: currentDictionary), fares: createFares(data: currentDictionary) )
            self.riders.append(newRider)
        }
    
    }
    
    func createSubtext(dict: NSDictionary) -> String {
        if let sub: String = dict.value(forKey: "subtext") as? String {
            return sub
        }else{
            return ""
        }
    }
    
    func createFares(data: NSDictionary) -> [Fare] {
        var arr: Array<Fare> = []
        let fareArray: Array<NSDictionary> = data.object(forKey: "fares") as! Array
        for element in fareArray {
           let newFare =  Fare.init(description: element.value(forKey: "description") as! String, price: element.value(forKey: "price") as! Double)
            arr.append(newFare)
        }
        return arr
    }
    
    
    
}
