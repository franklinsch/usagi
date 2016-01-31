//
//  MyTaskViewontroller.swift
//  usagi-iOS
//
//  Created by Franklin Schrans on 30/01/2016.
//  Copyright © 2016 Franklin Schrans. All rights reserved.
//

import UIKit

class MyTaskViewontroller: UIViewController {
    
    var task: Project!

    @IBOutlet weak var projectTitle: UILabel!
    @IBOutlet weak var projectProgressLabel: UILabel!
    @IBOutlet weak var participantsCollectionView: UICollectionView!
    @IBOutlet weak var projectDescriptionTextView: UITextView!
    @IBOutlet weak var dependentTasksStackView: UIStackView!
    @IBOutlet weak var dependentTasksText: UILabel!
    
    @IBOutlet weak var resumeTaskButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        updateLabels()
    }
    
    func updateLabels() {
        if self.task == nil {
            self.task = MockData.concurrencyBugTask
        }
        
        self.projectTitle.text = task.name
        self.projectProgressLabel.text = "Completion: \(task.progress)\t Est. time remaining: \(task.timeLeft)"
        
        guard let participantsListController = participantsCollectionView.dataSource as? ParticipantsCollectionViewController else {
            fatalError()
        }
        
        participantsListController.participantPictures = task.participants.flatMap({$0.profilePicture})
        
        self.projectDescriptionTextView.text = task.description
        
        if task.dependsOnTasks.count > 0 {
            dependentTasksText.text = task.dependsOnTasks.map({$0.name}).joinWithSeparator(",\n")
            resumeTaskButton.enabled = false
        } else {
            resumeTaskButton.enabled = true
            dependentTasksStackView.hidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "otherTaskSegue" {
            guard let destinationViewController = segue.destinationViewController as? ProjectsTableViewController else {
                fatalError()
            }
            
            destinationViewController.projects = MockData.availableTasks
        }
    }

}