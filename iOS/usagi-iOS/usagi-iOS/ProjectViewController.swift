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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
