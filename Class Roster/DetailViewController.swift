//
//  DetailViewController.swift
//  Class Roster
//
//  Created by Jeff Hendershot on 11/10/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    var selectedPerson : Person!
    var imagePickerController = UIImagePickerController()
    

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = self.selectedPerson.image
       

        self.nameLabel.text = self.selectedPerson.firstName + " " + self.selectedPerson.lastName
        
        
        
        self.title = "Details"
        //self.firstNameTextField.delegate = self

        // Do any additional setup after loading the view.
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
//        self.selectedPerson?.firstName = self.firstNameTextField.text
     
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func Camera(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            self.imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            
            self.imagePickerController.delegate = self
            
            self.imagePickerController.allowsEditing = true
            self.presentViewController(self.imagePickerController, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
            var image = info[UIImagePickerControllerEditedImage] as UIImage
            self.imageView.image = image
            self.selectedPerson.image = image
            
            self.imagePickerController.dismissViewControllerAnimated(true, completion: nil)
    }
}


