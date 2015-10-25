//
//  PhotosViewController.swift
//  Dropbox Exercise
//
//  Created by Sam Wander on 10/24/15.
//  Copyright © 2015 Sam Wander. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var importButton: UIButton!
    @IBOutlet weak var backgroundWash: UIView!
    
    // Init image picker
    let imagePicker = UIImagePickerController()
    // Array for displaying images
    var imageGrid:[UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundWash.hidden = true // to cover bg illustration
        imagePicker.delegate = self
    }
       
    
    @IBAction func didPressImportButton(sender: AnyObject) {
        
        // Show native image picker
        imagePicker.sourceType = .PhotoLibrary
        imagePicker.allowsEditing = false
        self.presentViewController(imagePicker, animated: true,
            completion: nil)
    }
    
    // Return with image
    func imagePickerController(
        picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
                imageGrid.append(pickedImage) // add picked image to array
                displayGrid(imageGrid) // render grid image views
            }
            backgroundWash.hidden = false // cover bg illustration
            dismissViewControllerAnimated(true, completion: nil)
    }
    
    // If cancel
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // Step through array and display images in grid
    func displayGrid(images: Array<UIImage>) -> Void {
        var x = 0 // x pos
        var y = -1 // y pos
        for i in images {
            x++
            let n = images.indexOf(i)!
            // Wrap after 3
            if n%3 == 0 {
                x = 0
                y++
            }
            let gridImage = UIImageView(frame: CGRect(x: (x * 90) + 20 + (x * 5), y: (y * 90) + 85 + (y * 5), width: 90, height: 90))
            gridImage.contentMode = .ScaleAspectFill
            gridImage.clipsToBounds = true
            gridImage.image = i
            self.view.addSubview(gridImage)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
