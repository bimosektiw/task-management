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
    
    // Coin Element Variable
    @IBOutlet weak var labelCoinBorder: UILabel!
    @IBOutlet weak var labelUserName: UILabel!
    
    //Character Appearance Variable
    @IBOutlet weak var imageBody: UIImageView!
    @IBOutlet weak var imageHair: UIImageView!
    @IBOutlet weak var imageClothes: UIImageView!
    @IBOutlet weak var imageAccessories: UIImageView!
    
    //Button Element Variable
    @IBOutlet weak var buttonMyTask: UIButton!
    @IBOutlet weak var buttonShop: UIButton!
        
    var characterName : String = ""
    override func viewDidLoad() {
        self.reloadInputViews()
        super.viewDidLoad()
        let userDefaults = UserDefaults()
        
        // Get username ( Read from  UserDefaults )
        if let data = userDefaults.object(forKey: "characterName"){
            // Check data is string or not 
            if let message = data as? String{
                self.characterName = message
            }
        }
        labelUserName.text = "Hello \(characterName)"
        completedTask()
        
        // Do any additional setup after loading the view.
        navigationController?.title = "Dashboard"
        
        // Character Border
        
        // Coin Appearance
        labelCoinBorder.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        labelCoinBorder.layer.borderWidth = 1
        labelCoinBorder.layer.cornerRadius = 10
        
        // My Task Button Appearance
        buttonMyTask.layer.cornerRadius = 12
        buttonMyTask.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        buttonMyTask.layer.borderWidth = 1
        
        // Shop Button Appearance
        buttonShop.layer.cornerRadius = 12
        buttonShop.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        buttonShop.layer.borderWidth = 1
        
        
        
    }
    
    // Function Running every Page loaded
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let userDefaults = UserDefaults()
        // Get completedTask and Change Character's Emototion
        if userDefaults.integer(forKey: "completedTask") == (TaskList.shared.getAllTask().count) {
            userDefaults.setValue("body-4", forKey: "characterBody")
        }
        else if userDefaults.integer(forKey: "completedTask") >= TaskList.shared.getAllTask().count/2 {
            userDefaults.setValue("body-1", forKey: "characterBody")
        }
        else if userDefaults.integer(forKey: "completedTask") > 0 {
            userDefaults.setValue("body-3", forKey: "characterBody")
        }
        else if userDefaults.integer(forKey: "completedTask") == 0{
            userDefaults.setValue("body-2", forKey: "characterBody")
        }
        
        // Get Character Appearance from UserDefaults
        if let data = userDefaults.object(forKey: "characterBody"){
           if let body = data as? String{
               self.imageBody.image = UIImage(named: body)
           }
        }
        if let data = userDefaults.object(forKey: "characterClothes"){
           if let clothes = data as? String{
               self.imageClothes.image = UIImage(named: clothes)
           }
        }
        if let data = userDefaults.object(forKey: "characterHair"){
           if let hair = data as? String{
               self.imageHair.image = UIImage(named: hair)
           }
        }
        if let data = userDefaults.object(forKey: "characterAccessories"){
           if let accessories = data as? String{
               self.imageAccessories.image = UIImage(named: accessories)
           }
        }
    }
    
    func completedTask() {
        var array = [Bool]()
        for i in 0..<TaskList.shared.getAllTask().count {
               array.append(TaskList.shared.getAllTask()[i].completed)
        }
        
        let userDefaults = UserDefaults()
        if let data = userDefaults.object(forKey: "completedTask"){
            if let number = data as? Int{
                var taskComplete = number
                for item in array{
                    if item as Bool? == true{
                        taskComplete += 1
                    }
                }
                userDefaults.setValue(taskComplete, forKey: "completedTask")
            }
        }
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
