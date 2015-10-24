//
//  PhotosViewController.swift
//  Dropbox Exercise
//
//  Created by Sam Wander on 10/24/15.
//  Copyright © 2015 Sam Wander. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {

    @IBOutlet weak var importButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
       
    
    @IBAction func didPressImportButton(sender: AnyObject) {
        
        let imagePicker = UIImagePickerController()

        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imagePicker.allowsEditing = false
        
        self.presentViewController(imagePicker, animated: true,
            completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
