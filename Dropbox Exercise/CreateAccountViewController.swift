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
    
    var progress = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func didTapScreen(sender: AnyObject) {
        progress++
        if progress < self.view.subviews.count {
            self.view.sendSubviewToBack(self.view.subviews.last!)
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
