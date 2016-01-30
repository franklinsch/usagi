//
//  ProjectsTableViewController.swift
//  usagi-iOS
//
//  Created by Franklin Schrans on 30/01/2016.
//  Copyright © 2016 Franklin Schrans. All rights reserved.
//

import UIKit

class ProjectsTableViewController: UITableViewController {
    
    var projects: [Project] = [
        Project(name: "Operating System Scheduler", description: "Reimplement timer_sleep(), defined in ‘devices/timer.c’. \nAlthough a working implementation of timer_sleep is provided, it \"busy waits\", that is, it spins in a loop checking the current time and calling thread_yield() until enough time has gone by. Reimplement it to avoid busy waiting.", participants: [User(name: "Tony Field", projects: [], rank: .Developer, profilePicture: UIImage(named: "tonyfield.jpg"))], subtasks: [
            Project(name: "Refactor timer_interrupt", description: "", participants: [], subtasks: [])
            ]),
        
        Project(name: "Web server in Swift", description: "Creating a web server running on Swift.", participants: [User(name: "Tony Field", projects: [], rank: .Developer, profilePicture: UIImage(named: "tonyfield.jpg")), User(name: "Tony Field", projects: [], rank: .Developer, profilePicture: UIImage(named: "tonyfield.jpg"))], subtasks: []),
        
        Project(name: "Potato Launcher", description: "Revolutionize the way we launch potatoes.", participants: [User(name: "Tony Field", projects: [], rank: .Developer, profilePicture: UIImage(named: "tonyfield.jpg"))], subtasks: []),
    ]

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
        
//        let participantPictures: [UIImage] = project.participants.flatMap({
//            return $0.profilePicture
//        })
        
//        guard let _participantsView = projectCell.participantsView.delegate as? ParticipantsCollectionViewController else {
//            fatalError("Could not cast CollectionViewController to ParticipantsCollectionViewController")
//        }
//        
//        _participantsView.participantPictures = participantPictures
        projectCell.participantsCount.text = "\(project.participants.count)"

        return projectCell
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
}
