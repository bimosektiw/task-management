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
    @IBOutlet weak var roundedView: UIView!
    @IBOutlet weak var coinLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tasksTableView.delegate = self
        tasksTableView.dataSource = self
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func setupView() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(onEditTapped))
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: 50, height: 40))
        label.font = UIFont.boldSystemFont(ofSize: 17)

        label.text = "My Tasks"
        label.numberOfLines = 2
        label.textColor = .black
        label.sizeToFit()
        label.textAlignment = .center

        self.navigationItem.titleView = label
        navigationItem.largeTitleDisplayMode = .never
        
        roundedView.layer.borderColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
        roundedView.layer.borderWidth = 1
        roundedView.layer.cornerRadius = 10
        
        tasksTableView.tableFooterView = UIView(frame: .zero)
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let task = TaskList.shared.getTasksForCategoryNumber(indexPath.section)[indexPath.row]
            TaskList.shared.deleteTaskById(id: task.id)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        view.tintColor = #colorLiteral(red: 0.9466527104, green: 0.9426648021, blue: 0.9497463107, alpha: 1)
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.black
    }
    
    @objc func onEditTapped() {
        if tasksTableView.isEditing {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(onEditTapped))
            
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(onEditTapped))
        }
        tasksTableView.isEditing = !tasksTableView.isEditing
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let task = TaskList.shared.getTasksForCategoryNumber(sourceIndexPath.section)[sourceIndexPath.row]
        TaskList.shared.deleteTaskById(id: task.id)
        TaskList.shared.insert(title: task.title, duration: task.duration, category: destinationIndexPath.section)
        tasksTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskList.shared.getTasksForCategoryNumber(section).count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if TaskList.shared.getAllTask().count == 0 {
            return 0
        } else {
            return 4
        }
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
        cell.textLabel?.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        if task.completed {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        switch task.category {
        case 0:
            cell.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.09019607843, blue: 0.2666666667, alpha: 1)
            break
        case 1:
            cell.backgroundColor = #colorLiteral(red: 0, green: 0.6745098039, blue: 0.7803921569, alpha: 1)
            break
        case 2:
            cell.backgroundColor = #colorLiteral(red: 0.337254902, green: 0.7803921569, blue: 0, alpha: 1)
            break
        case 3:
            cell.backgroundColor = #colorLiteral(red: 0.7058823529, green: 0.7058823529, blue: 0.7058823529, alpha: 1)
            break
        default:
            cell.backgroundColor = .clear
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = TaskList.shared.getTasksForCategoryNumber(indexPath.section)[indexPath.row]
        
        if !task.completed {
            let alert = UIAlertController(title: "Are you sure you want to complete this task?", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) in
                let task = TaskList.shared.getTasksForCategoryNumber(indexPath.section)[indexPath.row]
                TaskList.shared.changeCompletedTaskById(id: task.id, completed: true)
                self.tasksTableView.reloadData()
            }))
            present(alert, animated: true, completion: nil)
        }
        tasksTableView.deselectRow(at: indexPath, animated: true)
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
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if tasksTableView.isEditing {
            return true
        } else {
            return false
        }
    }
}
