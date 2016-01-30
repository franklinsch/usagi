//
//  Project.swift
//  usagi-iOS
//
//  Created by Franklin Schrans on 30/01/2016.
//  Copyright © 2016 Franklin Schrans. All rights reserved.
//

import Foundation

struct Project {
    var name: String
    var description: String
    var participants: [User]
    var subtasks: [Project]
}
