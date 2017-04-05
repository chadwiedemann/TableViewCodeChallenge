//
//  ConfirmSelectionViewController.swift
//  moovelCodeChalenge
//
//  Created by Chad Wiedemann on 4/5/17.
//  Copyright © 2017 Chad Wiedemann LLC. All rights reserved.
//

import UIKit

class ConfirmSelectionViewController: UIViewController {

    var currentFare: Fare!
    var currentRider: Rider!
    var numberOfTickets = 1
    
    
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var riderTypeLabel: UILabel!
    
    @IBOutlet weak var passTypeLabel: UILabel!
    
    @IBOutlet weak var numberOfTicketsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.numberOfTicketsLabel.text = self.numberOfTickets.description
        self.passTypeLabel.text = currentFare.fareDescription
        self.riderTypeLabel.text = currentRider.type
        self.confirmButton.setTitle("Buy \(self.numberOfTickets) Tickets - $\(currentFare.price * Double(self.numberOfTickets))", for: UIControlState.normal)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addTicketButton(_ sender: UIButton) {
        self.numberOfTickets += 1
        self.numberOfTicketsLabel.text = self.numberOfTickets.description
        self.updateLabel()
        
    }

    @IBAction func subtractTicketButton(_ sender: UIButton) {
        if self.numberOfTickets > 0 {
            self.numberOfTickets -= 1
            self.numberOfTicketsLabel.text = self.numberOfTickets.description
            self.updateLabel()
        }
        
    }
    
    func updateLabel()  {
        self.confirmButton.setTitle("Buy \(self.numberOfTickets) Tickets - $\(currentFare.price * Double(self.numberOfTickets))", for: UIControlState.normal)
    }
    

}
