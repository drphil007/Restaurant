//
//  OrderConfirmationViewController.swift
//  Restaurant
//
//  Created by Philine Wairata on 12/05/2018.
//  Copyright © 2018 Philine Wairata. All rights reserved.
//

import UIKit

class OrderConfirmationViewController: UIViewController {
    
    @IBOutlet weak var timeRemainingLabel: UILabel!
    var minutes: Int!

    /// Shows message after wait when data received from server.
    override func viewDidLoad() {
        super.viewDidLoad()
        timeRemainingLabel.text = "Thank you for your order! Your wait time is approximately \(minutes!) minutes."
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
