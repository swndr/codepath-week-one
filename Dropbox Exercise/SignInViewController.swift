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
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    @IBOutlet weak var emailAddressField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    let optionMenu: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
    var optionMenuBuilt = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backToWelcome(sender: AnyObject) {
        // Navigate back one step
        navigationController?.popViewControllerAnimated(true)
    }
    
    // Test whether all fields completed
    @IBAction func emailAddressEditingChanged(sender: AnyObject) {
        checkFormCompletion()
    }
    
    @IBAction func passwordEditingChanged(sender: AnyObject) {
        checkFormCompletion()
    }
    
    // Progress through text fields by tapping 'Next'
    @IBAction func emailAddressDidEndOnExit(sender: AnyObject) {
        self.passwordField.becomeFirstResponder()
    }
    @IBAction func passwordDidEndOnEditing(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func didPressForgotPasswordButton(sender: AnyObject) {

        if !optionMenuBuilt {
            let deleteAction = UIAlertAction(title: "Forgot Password", style: .Default, handler: {
                (alert: UIAlertAction!) -> Void in
            })
            
            let saveAction = UIAlertAction(title: "Single Sign-On", style: .Default, handler: {
                (alert: UIAlertAction!) -> Void in
            })
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: {
                (alert: UIAlertAction!) -> Void in
            })
            
            optionMenu.addAction(deleteAction)
            optionMenu.addAction(saveAction)
            optionMenu.addAction(cancelAction)
            optionMenuBuilt = true
        }
    
        presentViewController(optionMenu, animated: true, completion: nil)
    }
    
    // Check no text fields are empty, and password is 8 or more chars
    func checkFormCompletion() {
        if emailAddressField.text!.isEmpty || passwordField.text!.isEmpty {
            signInButton.enabled = false
        } else if passwordField.text?.characters.count >= 8 {
            signInButton.enabled = true
        }
    }
    
    @IBAction func didTapScreen(sender: AnyObject) {
        view.endEditing(true)
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
