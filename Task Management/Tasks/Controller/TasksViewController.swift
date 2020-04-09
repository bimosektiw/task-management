//
//  TasksViewController.swift
//  Task Management
//
//  Created by Rahman Fadhil on 07/04/20.
//  Copyright © 2020 Bimo Sekti Wicaksono. All rights reserved.
//

import UIKit

protocol TasksDelegate {
    func insertTask(title: String, category: Task.TaskCategory, duration: Int)
}

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TasksDelegate {

    @IBOutlet weak var tasksTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tasksTableView.delegate = self
        tasksTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskList.shared.getTasksForCategoryNumber(section).count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "!!!!"
        case 1:
            return "!!!"
        case 2:
            return "!!"
        case 3:
            return "!"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        let task = TaskList.shared.getTasksForCategoryNumber(indexPath.section)[indexPath.row]
        cell.textLabel?.text = task.title
        return cell
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? NewTaskViewController {
            vc.tasksDelegate = self
        }
    }
    
    func insertTask(title: String, category: Task.TaskCategory, duration: Int) {
        TaskList.shared.insert(title: title, duration: duration, category: category)
        tasksTableView.reloadData()
    }
}
