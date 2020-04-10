//
//  TasksViewController.swift
//  Task Management
//
//  Created by Rahman Fadhil on 07/04/20.
//  Copyright © 2020 Bimo Sekti Wicaksono. All rights reserved.
//

import UIKit

protocol TasksDelegate {
    func insertTask(title: String, category: Int, duration: Int)
}

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TasksDelegate {

    @IBOutlet weak var tasksTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tasksTableView.delegate = self
        tasksTableView.dataSource = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(onEditTapped))
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let task = TaskList.shared.getTasksForCategoryNumber(indexPath.section)[indexPath.row]
            TaskList.shared.deleteTaskById(id: task.id)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    @objc func onEditTapped() {
        tasksTableView.isEditing = !tasksTableView.isEditing
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let task = TaskList.shared.getTasksForCategoryNumber(sourceIndexPath.section)[sourceIndexPath.row]
        TaskList.shared.deleteTaskById(id: task.id)
        TaskList.shared.insert(title: task.title, duration: task.duration, category: destinationIndexPath.section)
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
        if task.completed {
            cell.accessoryType = .checkmark
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Are you sure you want to complete this task?", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) in
            let task = TaskList.shared.getTasksForCategoryNumber(indexPath.section)[indexPath.row]
            TaskList.shared.deleteTaskById(id: task.id)
            TaskList.shared.insert(title: task.title, duration: task.duration, category: indexPath.section, completed: true)
            self.tasksTableView.reloadData()
        }))
        present(alert, animated: true, completion: nil)
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? NewTaskViewController {
            vc.tasksDelegate = self
        }
    }
    
    func insertTask(title: String, category: Int, duration: Int) {
        TaskList.shared.insert(title: title, duration: duration, category: category)
        tasksTableView.reloadData()
    }
}
