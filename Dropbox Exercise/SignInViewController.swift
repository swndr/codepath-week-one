//
//  SignInViewController.swift
//  Dropbox Exercise
//
//  Created by Sam Wander on 10/20/15.
//  Copyright © 2015 Sam Wander. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet var didTapScreen: UITapGestureRecognizer!
    @IBOutlet weak var backToWelcomeButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    // Empty array for image subviews
    var images: [UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Get all image subviews
        images = self.view.subviews.filter{$0 is UIImageView}
        
        // Disable sign in button
        signInButton.enabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backToWelcome(sender: AnyObject) {
        // Navigate back one step
        navigationController?.popViewControllerAnimated(true)
    }

    
    @IBAction func didTapScreen(sender: AnyObject) {
        
        if images.count == 2 {
            // Enable sign in button
            signInButton.enabled = true
        }

        if images.count > 1 {
        // Hide front subview image until last
            self.view.sendSubviewToBack(images.last!)
            images.removeLast()
        }
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
