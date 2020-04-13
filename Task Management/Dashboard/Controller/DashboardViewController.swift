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
    @IBOutlet weak var imageHair: UIImageView!
    @IBOutlet weak var imageClothes: UIImageView!
    
    //Button Element Variable
    @IBOutlet weak var buttonMyTask: UIButton!
    @IBOutlet weak var buttonShop: UIButton!
    
    // Variable for preparing pass data from 1st page
    let characterType : String = "male"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set username
        labelUserName.text = "Hello Brod!"
        
        // Get CharacterType
        setCharacter(characterTypeParameter: characterType)
        
        // Do any additional setup after loading the view.
        navigationController?.title = "Dashboard"
        
        // Coin Appearance
        labelCoinBorder.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        labelCoinBorder.layer.borderWidth = 2
        labelCoinBorder.layer.cornerRadius = 10
        
        // My Task Button Appearance
        buttonMyTask.layer.cornerRadius = 12
        buttonMyTask.layer.borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        buttonMyTask.layer.borderWidth = 1
        
        // Shop Button Appearance
        buttonShop.layer.cornerRadius = 12
        buttonShop.layer.borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        buttonShop.layer.borderWidth = 1
    }
    
    func setCharacter(characterTypeParameter: String){
        switch characterTypeParameter {
        case "male":
            imageClothes.image = #imageLiteral(resourceName: "Crew_Neck_Blue")
            imageHair.image = #imageLiteral(resourceName: "ShortHairMale")
        case "female":
            imageHair.image = #imageLiteral(resourceName: "Long_Hair_Female")
            imageClothes.image = #imageLiteral(resourceName: "Crew_Neck_Blue")
        default:
            imageClothes.image = #imageLiteral(resourceName: "Crew_Neck_Blue")
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
