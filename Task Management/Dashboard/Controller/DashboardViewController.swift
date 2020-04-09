//
//  DashboardViewController.swift
//  Task Management
//
//  Created by Rahman Fadhil on 07/04/20.
//  Copyright © 2020 Bimo Sekti Wicaksono. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    
    //Define variable connection for all element on storyboard
    @IBOutlet weak var labelCoinBorder: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Making border for coin display
        labelCoinBorder.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        labelCoinBorder.layer.borderWidth = 2
        labelCoinBorder.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
        navigationController?.title = "Dashboard"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
