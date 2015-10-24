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
    @IBOutlet weak var createButton: UIButton!
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailAddressField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    let optionMenu: UIAlertController = UIAlertController(title: nil, message: "Before you can complete your registration, you must accept the Dropbox Terms of Service", preferredStyle: .ActionSheet)
    var optionMenuBuilt = false
    var acceptedTerms = false
    
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
    
    // Test whether all fields completed
    @IBAction func firstNameEditingChanged(sender: AnyObject) {
        checkFormCompletion()
    }
    @IBAction func lastNameEditingChanged(sender: AnyObject) {
        checkFormCompletion()
    }
    @IBAction func emailAddressEditingChanged(sender: AnyObject) {
        checkFormCompletion()
    }
    @IBAction func passwordEditingChanged(sender: AnyObject) {
        checkFormCompletion()
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
                self.acceptedTerms = true
            })
            
            let saveAction = UIAlertAction(title: "View Terms", style: .Default, handler: {
                (alert: UIAlertAction!) -> Void in
                self.performSegueWithIdentifier("openTerms", sender: self)
            })
            
            optionMenu.addAction(deleteAction)
            optionMenu.addAction(saveAction)
            optionMenuBuilt = true
        }
        
        // Show the action sheet
        showActionSheet()
    }
    
    // Check no text fields are empty, and password is 8 or more chars
    func checkFormCompletion() {
        if firstNameField.text!.isEmpty || lastNameField.text!.isEmpty || emailAddressField.text!.isEmpty || passwordField.text!.isEmpty {
           createButton.enabled = false
        } else if passwordField.text?.characters.count >= 8 && acceptedTerms {
            createButton.enabled = true
        }
    }
    
    // Show the T&Cs action sheet
    func showActionSheet() {
        presentViewController(optionMenu, animated: true, completion: nil)
    }
    
    // Dismiss keyboard
    @IBAction func didTapScreen(sender: AnyObject) {
        view.endEditing(true)
    }
    
    // Create account if form validated
    @IBAction func didPressCreateAccountButton(sender: AnyObject) {
        self.performSegueWithIdentifier("createAccount", sender: self)
    }
    
    // When dismissing terms, re=open action sheet
    @IBAction func dismissTerms (segue:UIStoryboardSegue) {
        // This wouldn't work unless use this delay thing I found
        dispatch_async(dispatch_get_main_queue(), {
            self.showActionSheet()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
