//
//  ProjectViewController.swift
//  usagi-iOS
//
//  Created by Franklin Schrans on 30/01/2016.
//  Copyright © 2016 Franklin Schrans. All rights reserved.
//

import UIKit

class ProjectViewController: UIViewController {
    
    var project: Project? = nil
    
//    @IBOutlet weak var projectTitle: UILabel!
    @IBOutlet weak var participantsList: UICollectionView!
    @IBOutlet weak var projectDescription: UITextView!
    @IBOutlet weak var tasksTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.participantsList.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "participantID")
        
        if let project = self.project {
            self.navigationItem.title = project.name
            self.projectDescription?.text = project.description
            
            guard let tasksTableViewContoller = tasksTableView.delegate as? ProjectsTableViewController else {
                fatalError()
            }
            
           tasksTableViewContoller.projects = project.subtasks
            
            guard let participantsListController = participantsList.dataSource as? ParticipantsCollectionViewController else {
               fatalError()
            }

            participantsListController.participantPictures = project.participants.flatMap({$0.profilePicture})
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func requestParticipation(sender: AnyObject) {
        let managerString = ", \(project?.manager?.name), " ?? ""
        
        let alertController = UIAlertController(title: "Request to work on \(project!.name)?", message: "The manager\(managerString)will have to approve your request", preferredStyle: .ActionSheet)
        alertController.addAction(UIAlertAction(title: "Yes", style: .Default, handler: {_ in self.showRequestConfirmationAlert()}))
        alertController.addAction(UIAlertAction(title: "Maybe Later", style: .Default, handler: {_ in }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: {_ in }))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func showRequestConfirmationAlert() {
        let alertController = UIAlertController(title: "Request sent!", message: "\(project!.manager!.name) will take your request into consideration.", preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }

    // MARK: - Navigation

//    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "taskDetailSegue" {
            guard let destinationViewController = segue.destinationViewController as? MyTaskViewontroller else {
                fatalError()
            }
            if let row = tasksTableView.indexPathForCell(sender as! UITableViewCell)?.row {
                let selectedTask = project?.subtasks[row]
                destinationViewController.task = selectedTask
            }
        }
    }

}
