//
//  NewTaskTableViewController.swift
//  usagi-iOS
//
//  Created by Franklin Schrans on 31/01/2016.
//  Copyright © 2016 Franklin Schrans. All rights reserved.
//

import UIKit

class NewTaskTableViewController: UITableViewController {
    
    @IBOutlet var taskNameField: UITextField!
    @IBOutlet var projectNameField: UITextField!
    @IBOutlet var descriptionField: UITextField!
    @IBOutlet var dependencyCount: UILabel!
    
    var tasks: [Project]!
    var dependencies = [Project]()

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


    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        dependencyCount.text = "\(dependencies.count) dependencies"
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addDependencySegue" {
            guard let destinationViewController = segue.destinationViewController as? AddDependencyTableViewController else {
                fatalError()
            }
            
            destinationViewController.dependencies = tasks
        }
    }
    
    @IBAction func addNewDependency(sender: UIStoryboardSegue) {
        guard let sourceViewController = sender.sourceViewController as? AddDependencyTableViewController else {
            fatalError()
        }
        
        dependencies = sourceViewController.selectedDependencies
    }
}
