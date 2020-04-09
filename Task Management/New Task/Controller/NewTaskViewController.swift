//
//  NewTaskViewController.swift
//  Task Management
//
//  Created by Rahman Fadhil on 07/04/20.
//  Copyright © 2020 Bimo Sekti Wicaksono. All rights reserved.
//

import UIKit

class NewTaskViewController: UIViewController {
    
    var tasksDelegate: TasksDelegate?

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var durationTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        
        guard let title = titleTextField.text else { return }
        guard let duration = durationTextField.text else { return }
        tasksDelegate?.insertTask(title: title, category: Task.TaskCategory(rawValue: 0)!.rawValue, duration: Int(duration)!)
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
