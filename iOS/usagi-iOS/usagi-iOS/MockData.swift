//
//  MockData.swift
//  usagi-iOS
//
//  Created by Franklin Schrans on 30/01/2016.
//  Copyright © 2016 Franklin Schrans. All rights reserved.
//

import UIKit

class MockData {
    static var schedulerProject = Project(name: "Operating System Scheduler", description: "Reimplement timer_sleep(), defined in ‘devices/timer.c’. \nAlthough a working implementation of timer_sleep is provided, it \"busy waits\", that is, it spins in a loop checking the current time and calling thread_yield() until enough time has gone by. Reimplement it to avoid busy waiting.", participants: [tonyField, linus, tonyField, linus, linus], subtasks: [
        Project(name: "Refactor timer_interrupt", description: "", participants: [], subtasks: []),
        Project(name: "Use external interrupts for waiting", description: "", participants: [], subtasks: []),
        Project(name: "Fix concurrency bug", description: "", participants: [], subtasks: [])
        ])
    
    static var webServerProject = Project(name: "Web server in Swift", description: "Creating a web server running on Swift.", participants: [linus], subtasks: [])
    
    static var potatoLauncherProject = Project(name: "Potato Launcher", description: "Revolutionize the way we launch potatoes.", participants: [tonyField], subtasks: [])
    
    static var tonyField = User(name: "Tony Field", projects: [], rank: .Developer, profilePicture: UIImage(named: "tonyfield.jpg"))
    static var linus = User(name: "Linus Torvalds", projects: [], rank: .Developer, profilePicture: UIImage(named: "linus.jpeg"))
}