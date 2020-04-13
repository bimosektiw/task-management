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
    @IBOutlet weak var textFieldCharacterName: UITextField!
    
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

    @IBAction func setUserDefault(_ sender: UIButton) {
        // Set Username ( Write for UserDefaults )
        let userDefaults = UserDefaults()
        userDefaults.setValue(textFieldCharacterName.text, forKey: "characterName")
        userDefaults.setValue("body-1.png", forKey: "characterBody")
        userDefaults.setValue("Crew_Neck_Blue.png", forKey: "characterClothes")
        userDefaults.setValue("hair-default", forKey: "characterHair")
        userDefaults.setValue("", forKey: "characterAccessories")
        userDefaults.setValue(0, forKey: "completedTask")
    }
    
}

