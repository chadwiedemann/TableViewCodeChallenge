//
//  SelectRiderViewController.swift
//  moovelCodeChalenge
//
//  Created by Chad Wiedemann on 4/5/17.
//  Copyright © 2017 Chad Wiedemann LLC. All rights reserved.
//

import UIKit

class SelectRiderViewController: UIViewController {

    let dao = DAO.sharedInstance
    
    @IBOutlet weak var riderTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dao.readData()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SelectRiderViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "identifier")
        if cell == nil{
            cell = UITableViewCell.init(style: UITableViewCellStyle.subtitle, reuseIdentifier: "identifier")
        }
        let tempRider = dao.riders[indexPath.row]
        cell.textLabel?.text = tempRider.type
        cell.detailTextLabel?.text = tempRider.subtext
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dao.riders.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let controller = SelectFareViewController()
        controller.currentRider = dao.riders[indexPath.row]
        self.present(controller, animated: true, completion: nil)
    }
    
    
    
}
