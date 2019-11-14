//
//  ViewController.swift
//  TableViewIntroductionLab
//
//  Created by Benjamin Stone on 8/6/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var taskCell: UIView!
    
    //var taskList = Task.allTasks
    
    var taskList = [[Task]]() {
      didSet {
          tableView.reloadData()
      }
   }
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
         loadData()
    }
    func loadData() {
        taskList = Task.filterTask()
        
    }
   
}
extension ViewController: UITableViewDataSource {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        
        //return task[section].count
        return taskList.count
         
     }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        let tasks = taskList[indexPath.section][indexPath.row]
         
        // configuring the cells
        cell.textLabel?.text = tasks.name
        
        
        cell.detailTextLabel?.text = tasks.dueDate.description
        
        
        
    
         
        return cell
     }
func numberOfSections(in tableView: UITableView) -> Int {

     return taskList.count
    
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
        let string = taskList[section].first?.status.rawValue
    
    return string
 }
}
