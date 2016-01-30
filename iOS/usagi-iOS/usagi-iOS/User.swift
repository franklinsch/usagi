//
//  User.swift
//  usagi-iOS
//
//  Created by Franklin Schrans on 30/01/2016.
//  Copyright © 2016 Franklin Schrans. All rights reserved.
//

import UIKit

struct User {
    var name: String
    var projects: [Project]
    var rank: Rank
    var profilePicture: UIImage?
}

enum Rank {
    case Admin
    case ProjectManager
    case Developer
}