//
//  TaskList.swift
//  Task Management
//
//  Created by Rahman Fadhil on 09/04/20.
//  Copyright © 2020 Bimo Sekti Wicaksono. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class TaskList {
    static let shared = TaskList()
    
    func insert(title: String, duration: Int, category: Int, completed: Bool = false) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let taskEntity = NSEntityDescription.entity(forEntityName: "Tasks", in: managedContext)!
        
        let order = self.getTasksForCategoryNumber(category)
        
        let id = Int(arc4random())
        let searchId = getAllTask().filter{$0.id == id}
        if !searchId.isEmpty {
            insert(title: title, duration: duration, category: category)
        }
        
        let task = NSManagedObject(entity: taskEntity, insertInto: managedContext)
        task.setValue(id, forKeyPath: "id")
        task.setValue(title, forKeyPath: "title")
        task.setValue(duration, forKey: "duration")
        task.setValue(category, forKey: "category")
        task.setValue(completed, forKey: "completed")
        task.setValue(order.count, forKey: "order")

        do {
            try managedContext.save()
           
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func getTasksForCategoryNumber(_ categoryNumber: Int) -> [Task] {
        if categoryNumber > 3 {
            return [Task]()
        } else {
            return self.getAllTask().filter{$0.category == categoryNumber}
        }
    }
    
    func getAllTask() -> [Task]{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Tasks")
        do {
            let result = try managedContext.fetch(fetchRequest)
            var taskArray: [Task] = []
            for data in result as! [NSManagedObject] {
                let xx = Task(title: data.value(forKey: "title") as! String,
                               duration: data.value(forKey: "duration") as! Int,
                               completed: data.value(forKey: "completed") as! Bool,
                               category: data.value(forKey: "category") as! Int,
                               order: data.value(forKey: "order") as! Int,
                               id: data.value(forKey: "id") as! Int)
                taskArray.append(xx)
            }
            return taskArray
            
        } catch {
            
            print("Failed")
        }
        return [Task]()
    }
    
    func deleteTaskById(id: Int) {
         guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
         
         let managedContext = appDelegate.persistentContainer.viewContext
         
         let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Tasks")
         fetchRequest.predicate = NSPredicate(format: "id = %@", "\(id)")
        
         do
         {
             let test = try managedContext.fetch(fetchRequest)
             
             let objectToDelete = test[0] as! NSManagedObject
             managedContext.delete(objectToDelete)
             
             do{
                 try managedContext.save()
             }
             catch
             {
                 print(error)
             }
             
         }
         catch
         {
             print(error)
         }
    }
}
