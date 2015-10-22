//
//  termsViewController.swift
//  Dropbox Exercise
//
//  Created by Sam Wander on 10/22/15.
//  Copyright © 2015 Sam Wander. All rights reserved.
//

import UIKit

class termsViewController: UIViewController {

    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func didPressDone(sender: AnyObject) {
        // Close terms
        navigationController?.dismissViewControllerAnimated(true, completion: { () -> Void in
        // do nothing
        })
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
