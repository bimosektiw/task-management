//
//  ViewController.swift
//  Task Management
//
//  Created by Bimo Sekti Wicaksono on 04/04/20.
//  Copyright © 2020 Bimo Sekti Wicaksono. All rights reserved.
//

import UIKit

class SelectAvatarViewController: UIViewController {

    @IBOutlet weak var selectButtonLabel: UIButton!
    @IBOutlet weak var selectAvatarSection: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        selectButtonLabel.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        selectButtonLabel.layer.cornerRadius = 12
        selectButtonLabel.layer.borderWidth = 1
        selectButtonLabel.layer.borderColor = UIColor(red: 0, green: 172/255, blue: 199/255, alpha: 1).cgColor
        
        selectAvatarSection.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        selectAvatarSection.layer.cornerRadius = 12
    }


}

