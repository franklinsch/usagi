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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.projectTitle.text = task.name
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
