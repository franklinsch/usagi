//
//  ProjectsTableViewController.swift
//  usagi-iOS
//
//  Created by Franklin Schrans on 30/01/2016.
//  Copyright © 2016 Franklin Schrans. All rights reserved.
//

import UIKit

class ProjectsTableViewController: UITableViewController {
    
    var projects: [Project] = [MockData.schedulerProject, MockData.webServerProject, MockData.potatoLauncherProject]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        let url = NSURL(string: "https://hackcambridge-3218.appspot.com/usagi?function=getProject&projectName=hello")
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            if let _data = data {
                print(NSString(data: _data, encoding: NSUTF8StringEncoding))
            }
        }
        
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return projects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("projectID", forIndexPath: indexPath)

        guard let projectCell = cell as? ProjectTableViewCell else {
            fatalError("Project cell could not be casted to ProjectTableViewCell")
        }
        
        let project = projects[indexPath.row]
        projectCell.projectName.text = project.name
        projectCell.projectDescription.text = project.description
        
        projectCell.participantsCount.text = "\(project.participants.count)"

        return projectCell
    }
    
    @IBAction func saveNewProject(sender: UIStoryboardSegue) {
        guard let sourceViewController = sender.sourceViewController as? NewProjectTableViewController else {
            fatalError()
        }
        
        let newProject = Project(name: sourceViewController.projectNameField.text!, description: sourceViewController.descriptionField.text!, participants: [], subtasks: sourceViewController.tasks, progress: 0, timeLeft: "1h00")
        
        projects.append(newProject)
        tableView.reloadData()
        
        delay(seconds: 0.0, completion: {
            SwiftSpinner.show("Uploading to server")
        })
        
        delay(seconds: 1.0, completion: {
            SwiftSpinner.show("Allocating tasks")
        })
        
        delay(seconds: 2.0, completion: {
            SwiftSpinner.show("Optimizing deadlines")
        })
        
        delay(seconds: 4.0, completion: {
            SwiftSpinner.show("Retrieving data")
        })
        
        delay(seconds: 5.0, completion: {
            SwiftSpinner.hide()
        })
    }
    
    @IBAction func cancelNewProject(sender: UIStoryboardSegue) {
        
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "projectDetail" {
            guard let projectViewController = segue.destinationViewController as? ProjectViewController else {
                fatalError()
            }
            
            if let row = tableView.indexPathForCell(sender as! UITableViewCell)?.row {
                let selectedProject = projects[row]
                projectViewController.project = selectedProject
            }
        }
    }
    
    func delay(seconds seconds: Double, completion:()->()) {
        let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64( Double(NSEC_PER_SEC) * seconds ))
        
        dispatch_after(popTime, dispatch_get_main_queue()) {
            completion()
        }
    }
}
