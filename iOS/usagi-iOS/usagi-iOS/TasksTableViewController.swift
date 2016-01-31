//
//  TasksTableViewController.swift
//  usagi-iOS
//
//  Created by Franklin Schrans on 30/01/2016.
//  Copyright © 2016 Franklin Schrans. All rights reserved.
//

import UIKit

class TasksTableViewController: ProjectsTableViewController {
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let task = projects[indexPath.row]
        self.navigationController?.popViewControllerAnimated(true)
        guard let rootVC = self.navigationController?.viewControllers.last as? MyTaskViewontroller else {
            fatalError()
        }
        rootVC.task = task;
    }
}
