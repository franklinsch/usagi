//
//  MockData.swift
//  usagi-iOS
//
//  Created by Franklin Schrans on 30/01/2016.
//  Copyright © 2016 Franklin Schrans. All rights reserved.
//

import UIKit

class MockData {
    static var schedulerProject = Project(name: "Operating System Scheduler", description: "Reimplement timer_sleep(), defined in ‘devices/timer.c’. \nAlthough a working implementation of timer_sleep is provided, it \"busy waits\", that is, it spins in a loop checking the current time and calling thread_yield() until enough time has gone by. Reimplement it to avoid busy waiting.", participants: [tonyField, linus, lattner], subtasks: [refactorTimerInterruptTask, externalInterruptsTask, concurrencyBugTask], progress: 62, timeLeft: "20min", manager: linus)
    
    static var webServerProject = Project(name: "Web server in Swift", description: "Creating a web server running on Swift. Based on Apple’s open source programming language Swift, Perfect is a freely available development framework for client-side and server-side, Swift-based mobile and web software applications. It will give developers the ability to write less code by using only Swift for both frontend and backend infrastructures.", participants: [turing, lattner], subtasks: [], progress: 14, timeLeft: "9h41", manager: turing)
    
    static var potatoLauncherProject = Project(name: "Potato Launcher", description: "Revolutionize the way we launch potatoes, by Hooli XYZ. An entirely new approach, this gun is frightening. Launching small bore projectiles through a breech, it is menacing to behold, and a beauty to see.", participants: [trump], subtasks: [], progress: 43, timeLeft: "2h10", manager: trump)
    
    
    static var refactorTimerInterruptTask = Project(name: "Refactor timer_interrupt", description: "The crudest way to do synchronization is to disable interrupts, that is, to temporarily prevent the CPU from responding to interrupts. If interrupts are o↵, no other thread will preempt the running thread, because thread preemption is driven by the timer interrupt. If interrupts are on, as they normally are, then the running thread may be preempted by another at any time, whether between two C statements or even within the execution of one.", participants: [lattner], subtasks: [], progress: 32, timeLeft: "45min")
    
    static var externalInterruptsTask = Project(name: "Use external interrupts for waiting", description: "Running a thread for the first time is a special case. When thread_create() creates a new thread, it goes through a fair amount of trouble to get it started properly. In particular, the new thread hasn’t started running yet, so there’s no way for it to be running inside switch_ threads() as the scheduler expects.", participants: [linus, tonyField], subtasks: [], progress: 93, timeLeft: "1h03")
    
    static var concurrencyBugTask = Project(name: "Fix concurrency bug", description: "schedule() is responsible for switching threads. It is internal to ‘threads/thread.c’ and called only by the three public thread functions that need to switch threads: thread_block(), thread_ exit(), and thread_yield(). Before any of these functions call schedule(), they disable interrupts (or ensure that they are already disabled) and then change the running thread’s state to something other than running.", participants: [linus], subtasks: [], progress: 77, timeLeft: "3h20", dependsOnTasks: [externalInterruptsTask, refactorTimerInterruptTask])
    
    static var tonyField = User(name: "Tony Field", projects: [], rank: .Developer, profilePicture: UIImage(named: "tonyfield.jpg"))
    static var linus = User(name: "Linus Torvalds", projects: [], rank: .Developer, profilePicture: UIImage(named: "linus.jpeg"))
    static var lattner = User(name: "Chris Lattner", projects: [], rank: .Developer, profilePicture: UIImage(named: "lattner.jpeg"))
    static var turing = User(name: "Alan Turing", projects: [], rank: .Developer, profilePicture: UIImage(named: "turing.jpg"))
    static var trump = User(name: "Donald Trump", projects: [], rank: .Developer, profilePicture: UIImage(named: "trump.jpeg"))
    
    static var availableTasks = [refactorTimerInterruptTask, externalInterruptsTask, concurrencyBugTask]
}