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
    
    // Aciton sheet
    let optionMenu: UIAlertController = UIAlertController(title: nil, message: "Before you can complete your registration, you must accept the Dropbox Terms of Service", preferredStyle: .ActionSheet)
    var optionMenuBuilt = false
    var acceptedTerms = false
    
    // Password strength indicator
    let redPlaceholder = UIView()
    let orangePlaceholder = UIView()
    let yellowPlaceholder = UIView()
    let greenPlaceholder = UIView()
    let redIndicator = UIView()
    let orangeIndicator = UIView()
    let yellowIndicator = UIView()
    let greenIndicator = UIView()
    
    let passwordWeakColor = UIColor(red: 242/255, green: 0, blue: 0, alpha: 1)
    let passwordSoSoColor = UIColor(red: 245/255, green: 122/255, blue: 0, alpha: 1)
    let passwordGoodColor = UIColor(red: 252/255, green: 202/255, blue: 46/255, alpha: 1)
    let passwordGreatColor = UIColor(red: 0, green: 188/255, blue: 0, alpha: 1)
    
    @IBOutlet weak var passwordStrengthLabel: UILabel!
    
    let options = UIViewAnimationOptions.CurveEaseIn
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Build password strength indicator subviews
        self.redPlaceholder.frame = CGRect(x: 15, y: 263, width: 70, height: 4)
        self.redPlaceholder.backgroundColor = UIColor.lightGrayColor()
        self.redPlaceholder.hidden = true
        self.redIndicator.frame = CGRect(x: 15, y: 263, width: 0, height: 4)
        self.redIndicator.backgroundColor = passwordWeakColor
        self.orangePlaceholder.frame = CGRect(x: 90, y: 263, width: 70, height: 4)
        self.orangePlaceholder.backgroundColor = UIColor.lightGrayColor()
        self.orangePlaceholder.hidden = true
        self.orangeIndicator.frame = CGRect(x: 90, y: 263, width: 0, height: 4)
        self.orangeIndicator.backgroundColor = passwordSoSoColor
        self.yellowPlaceholder.frame = CGRect(x: 164, y: 263, width: 70, height: 4)
        self.yellowPlaceholder.backgroundColor = UIColor.lightGrayColor()
        self.yellowPlaceholder.hidden = true
        self.yellowIndicator.frame = CGRect(x: 164, y: 263, width: 0, height: 4)
        self.yellowIndicator.backgroundColor = passwordGoodColor
        self.greenPlaceholder.frame = CGRect(x: 240, y: 263, width: 70, height: 4)
        self.greenPlaceholder.backgroundColor = UIColor.lightGrayColor()
        self.greenPlaceholder.hidden = true
        self.greenIndicator.frame = CGRect(x: 240, y: 263, width: 0, height: 4)
        self.greenIndicator.backgroundColor = passwordGreatColor
        self.view.addSubview(redPlaceholder)
        self.view.addSubview(redIndicator)
        self.view.addSubview(orangePlaceholder)
        self.view.addSubview(orangeIndicator)
        self.view.addSubview(yellowPlaceholder)
        self.view.addSubview(yellowIndicator)
        self.view.addSubview(greenPlaceholder)
        self.view.addSubview(greenIndicator)
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
        adjustPasswordIndicator(passwordField.text!.characters.count) // Send password length to determine strength
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
                self.checkFormCompletion()
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
    
    // Animate the password strength indicator
    func adjustPasswordIndicator(passwordLength: Int) {
        switch passwordLength
        {
        case 0:
            passwordStrengthLabel.text = ""
            self.redPlaceholder.hidden = true
            self.orangePlaceholder.hidden = true
            self.yellowPlaceholder.hidden = true
            self.greenPlaceholder.hidden = true
            UIView.animateWithDuration(0.1, delay: 0.0, options: options, animations: { () -> Void in
                self.redIndicator.frame = CGRect(x: 15, y: 263, width: 0, height: 4)
                self.orangeIndicator.frame = CGRect(x: 90, y: 263, width: 0, height: 4)
                self.yellowIndicator.frame = CGRect(x: 164, y: 263, width: 0, height: 4)
                self.greenIndicator.frame = CGRect(x: 240, y: 263, width: 0, height: 4)
                }, completion: { finished in
            })
        case 1...3:
            passwordStrengthLabel.text = "Weak"
            passwordStrengthLabel.textColor = passwordWeakColor
            self.redPlaceholder.hidden = false
            self.orangePlaceholder.hidden = false
            self.yellowPlaceholder.hidden = false
            self.greenPlaceholder.hidden = false
            self.greenPlaceholder.alpha = 1.0
            UIView.animateWithDuration(0.5, delay: 0.0, options: options, animations: { () -> Void in
                self.redIndicator.frame = CGRect(x: 15, y: 263, width: 70, height: 4)
                self.orangeIndicator.frame = CGRect(x: 90, y: 263, width: 0, height: 4)
                self.yellowIndicator.frame = CGRect(x: 164, y: 263, width: 0, height: 4)
                self.greenIndicator.frame = CGRect(x: 240, y: 263, width: 0, height: 4)
                }, completion: { finished in
            })
        case 4...6:
            passwordStrengthLabel.text = "So-So"
            passwordStrengthLabel.textColor = passwordSoSoColor
            UIView.animateWithDuration(0.5, delay: 0.0, options: options, animations: { () -> Void in
                self.redIndicator.frame = CGRect(x: 15, y: 263, width: 70, height: 4)
                self.orangeIndicator.frame = CGRect(x: 90, y: 263, width: 70, height: 4)
                self.yellowIndicator.frame = CGRect(x: 164, y: 263, width: 0, height: 4)
                self.greenIndicator.frame = CGRect(x: 240, y: 263, width: 0, height: 4)
                }, completion: { finished in
            })
        case 7...10:
            passwordStrengthLabel.text = "Good"
            passwordStrengthLabel.textColor = passwordGoodColor
            UIView.animateWithDuration(0.5, delay: 0.0, options: options, animations: { () -> Void in
                self.redIndicator.frame = CGRect(x: 15, y: 263, width: 70, height: 4)
                self.orangeIndicator.frame = CGRect(x: 90, y: 263, width: 70, height: 4)
                self.yellowIndicator.frame = CGRect(x: 164, y: 263, width: 70, height: 4)
                self.greenIndicator.frame = CGRect(x: 240, y: 263, width: 0, height: 4)
                }, completion: { finished in
            })
        case 8...20:
            passwordStrengthLabel.text = "Great!"
            passwordStrengthLabel.textColor = passwordGreatColor
            UIView.animateWithDuration(0.5, delay: 0.0, options: options, animations: { () -> Void in
                self.redIndicator.frame = CGRect(x: 15, y: 263, width: 70, height: 4)
                self.orangeIndicator.frame = CGRect(x: 90, y: 263, width: 70, height: 4)
                self.yellowIndicator.frame = CGRect(x: 164, y: 263, width: 70, height: 4)
                self.greenIndicator.frame = CGRect(x: 240, y: 263, width: 70, height: 4)
                }, completion: { finished in
            })
        default:
            break
        }
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
