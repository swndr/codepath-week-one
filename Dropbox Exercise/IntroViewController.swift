//
//  ViewController.swift
//  Dropbox Exercise
//
//  Created by Sam Wander on 10/20/15.
//  Copyright © 2015 Sam Wander. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var welcomeScroll: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeScroll.frame.size = CGSizeMake(320, 568)
        welcomeScroll.contentSize = CGSizeMake(960, 568)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

