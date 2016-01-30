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
    
    @IBOutlet weak var projectTitle: UILabel!
    @IBOutlet weak var participantsList: UICollectionView!
    @IBOutlet weak var projectDescription: UITextView!
    @IBOutlet weak var tasksTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let projectName = self.project?.name {
            self.projectTitle!.text = projectName
        }
        if let description = self.project?.description {
            self.projectDescription?.text = description
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