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
    
    @IBOutlet weak var fourthCategory: UIButton!
    @IBOutlet weak var thirdCategory: UIButton!
    @IBOutlet weak var secondCategory: UIButton!
    @IBOutlet weak var firstCategory: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstCategory.layer.cornerRadius = 10
        secondCategory.layer.cornerRadius = 10
        thirdCategory.layer.cornerRadius = 10
        fourthCategory.layer.cornerRadius = 10
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func categoryTapped(_ sender: UIButton) {
        switch sender {
            case fourthCategory:
                createTask(category: .pentingMendesak)
            case thirdCategory:
                createTask(category: .pentingTidakMendesak)
            case secondCategory:
                createTask(category: .tidakPentingMendesak)
            case firstCategory:
                createTask(category: .tidakPentingTidakMendesak)
            default:
                createTask(category: .pentingMendesak)
        }
    }
    
    func createTask(category: Task.TaskCategory) {
        guard let title = titleTextField.text else { return }
        guard let duration = durationTextField.text else { return }
        tasksDelegate?.insertTask(title: title, category: category.rawValue, duration: Int(duration)!)
        navigationController?.popViewController(animated: true)
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
