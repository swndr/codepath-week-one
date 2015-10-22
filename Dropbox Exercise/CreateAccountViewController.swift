//
//  CreateAccountViewController.swift
//  Dropbox Exercise
//
//  Created by Sam Wander on 10/20/15.
//  Copyright © 2015 Sam Wander. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    @IBOutlet var didTapScreen: UITapGestureRecognizer!
    @IBOutlet weak var backToWelcomeButton: UIButton!
    @IBOutlet weak var viewTermsButton: UIButton!
    @IBOutlet weak var agreeButton: UIButton!
    
    // Empty array for image subviews
    var images: [UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Get all image subviews
        images = self.view.subviews.filter{$0 is UIImageView}
        
        // Disable buttons in action sheet
        viewTermsButton.enabled = false
        agreeButton.enabled = false
    }
    
    @IBAction func backToWelcome(sender: AnyObject) {
        // Navigate back one step
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func didTapScreen(sender: AnyObject) {
        
        if images.count == 2 {
            // Enable buttons in action sheet
            viewTermsButton.enabled = true
            agreeButton.enabled = true
        }
        
        if images.count > 1 {
            // Hide front subview image until last
            self.view.sendSubviewToBack(images.last!)
            images.removeLast()
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
