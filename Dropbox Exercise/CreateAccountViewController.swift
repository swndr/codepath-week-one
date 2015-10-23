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
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailAddressField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    let optionMenu: UIAlertController = UIAlertController(title: nil, message: "Before you can complete your registration, you must accept the Dropbox Terms of Service", preferredStyle: .ActionSheet)
    var optionMenuBuilt = false
    
    // Empty array for image subviews
    var images: [UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get all image subviews
        images = self.view.subviews.filter{$0 is UIImageView}
    }
    
    @IBAction func backToWelcome(sender: AnyObject) {
        // Navigate back one step
        navigationController?.popViewControllerAnimated(true)
    }
    
    // Progress through text fields by tapping 'Next'
    @IBAction func firstNameDidEndonExit(sender: AnyObject) {
        self.lastNameField.becomeFirstResponder()
    }
    @IBAction func lastNameDidEndOnExit(sender: AnyObject) {
        self.emailAddressField.becomeFirstResponder()
    }
    
    @IBAction func emailAddressDidEndOnExit(sender: AnyObject) {
        self.passwordField.becomeFirstResponder()
    }
    @IBAction func passwordDidEndOnExit(sender: AnyObject) {
        
        // Build action sheet
        if !optionMenuBuilt {
            let deleteAction = UIAlertAction(title: "I Agree", style: .Default, handler: {
                (alert: UIAlertAction!) -> Void in
                print("Agree")
                self.performSegueWithIdentifier("createAccount", sender: self)
            })
            
            let saveAction = UIAlertAction(title: "View Terms", style: .Default, handler: {
                (alert: UIAlertAction!) -> Void in
                print("Terms")
                self.performSegueWithIdentifier("openTerms", sender: self)
            })
            
            optionMenu.addAction(deleteAction)
            optionMenu.addAction(saveAction)
            optionMenuBuilt = true
        }
        
        // Show the action sheet
        self.presentViewController(optionMenu, animated: true, completion: nil)
    }
    
    @IBAction func didTapScreen(sender: AnyObject) {
        
        view.endEditing(true)
//        if images.count == 2 {
//            // Enable buttons in action sheet
//            viewTermsButton.enabled = true
//            agreeButton.enabled = true
//        }
//        
//        if images.count > 1 {
//            // Hide front subview image until last
//            self.view.sendSubviewToBack(images.last!)
//            images.removeLast()
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
