//
//  NewProjectTableViewController.swift
//  usagi-iOS
//
//  Created by Franklin Schrans on 31/01/2016.
//  Copyright © 2016 Franklin Schrans. All rights reserved.
//

import UIKit

class NewProjectTableViewController: UITableViewController {

    @IBOutlet weak var projectNameField: UITextField!
    @IBOutlet weak var projectManagerField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var numTasksLabel: UILabel!
    
    var tasks = [Project]()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        numTasksLabel.text = "\(tasks.count) Tasks"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addTaskSegue" {
            guard let destinationViewController = segue.destinationViewController as? AddTaskTableViewController else {
                fatalError()
            }
            
            destinationViewController.tasks = tasks
            destinationViewController.projectName = projectNameField.text
        }
    }
    
    @IBAction func saveNewTasks(sender: UIStoryboardSegue) {
        guard let sourceViewController = sender.sourceViewController as? AddTaskTableViewController else {
            fatalError()
        }
        
        tasks.appendContentsOf(sourceViewController.tasks)
        tableView.reloadData()
    }

}
