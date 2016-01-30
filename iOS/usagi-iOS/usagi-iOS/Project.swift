//
//  Project.swift
//  usagi-iOS
//
//  Created by Franklin Schrans on 30/01/2016.
//  Copyright © 2016 Franklin Schrans. All rights reserved.
//

import Foundation

class Project {
    var name: String
    var description: String
    var participants: [User]
    var subtasks: [Project]
    var dependsOnTasks = [Project]()
    var progress: Int
    var timeLeft: String
    
    init(name: String, description: String, participants: [User], subtasks: [Project], progress: Int, timeLeft: String) {
        self.name = name
        self.description = description
        self.participants = participants
        self.subtasks = subtasks
        self.progress = progress
        self.timeLeft = timeLeft
    }
}
