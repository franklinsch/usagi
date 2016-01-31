//
//  LoginViewController.swift
//  usagi-iOS
//
//  Created by Franklin Schrans on 31/01/2016.
//  Copyright © 2016 Franklin Schrans. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var uptimalLogo: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        welcomeLabel.transform = CGAffineTransformMakeTranslation(0, -10)
        welcomeLabel.alpha = 0.0
        
        UIView.animateWithDuration(0.6, delay: 0.2, options: .TransitionNone, animations: {
            self.welcomeLabel.transform = CGAffineTransformIdentity
            self.welcomeLabel.alpha = 1.0
        }, completion: nil)
        
        uptimalLogo.transform = CGAffineTransformMakeScale(1.2, 1.2)
        uptimalLogo.alpha = 0.0
        
        UIView.animateWithDuration(1.2, delay: 0.5, options: .TransitionNone, animations: {
            self.uptimalLogo.transform = CGAffineTransformIdentity
            self.uptimalLogo.alpha = 1.0
        }, completion: nil)
        
        descLabel.transform = CGAffineTransformMakeTranslation(0, 0)
        descLabel.alpha = 0.0
        
        UIView.animateWithDuration(0.6, delay: 1.5, options: .TransitionNone, animations: {
            self.descLabel.transform = CGAffineTransformIdentity
            self.descLabel.alpha = 1.0
        }, completion: nil)
        
        loginButton.transform = CGAffineTransformMakeTranslation(0, 0)
        loginButton.alpha = 0.0
        
        UIView.animateWithDuration(0.6, delay: 1.5, options: .TransitionNone, animations: {
            self.loginButton.transform = CGAffineTransformIdentity
            self.loginButton.alpha = 1.0
        }, completion: nil)
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
