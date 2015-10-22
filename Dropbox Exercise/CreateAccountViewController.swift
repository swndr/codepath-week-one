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
    
    var images: [UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        images = self.view.subviews.filter{$0 is UIImageView}
    }
    
    @IBAction func backToWelcome(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func didTapScreen(sender: AnyObject) {
        if images.count > 1 {
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
