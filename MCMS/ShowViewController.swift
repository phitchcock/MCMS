//
//  ShowViewController.swift
//  MCMS
//
//  Created by Peter Hitchcock on 10/7/14.
//  Copyright (c) 2014 Peter Hitchcock. All rights reserved.
//

import UIKit
import CoreData

class ShowViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var name:String!
    var detail:String!
    //var image:UIImage!
    var existingCreature:NSManagedObject!

    @IBOutlet weak var creatureNameLabel: UILabel!
    @IBOutlet weak var updateCreateTextField: UITextField!
    @IBOutlet weak var updateCreatureDetail: UITextField!
    @IBOutlet weak var creatureImageView: UIImageView!

    @IBAction func updateImage(sender: AnyObject) {
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let context: NSManagedObjectContext = appDelegate.managedObjectContext!
        let entityList = NSEntityDescription.entityForName("MagicalCreature", inManagedObjectContext: context)
        var newCreature = MagicalCreature(entity: entityList!, insertIntoManagedObjectContext: context)

        var imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        self.presentViewController(imagePicker, animated: true, completion: nil)


        //var newImage = UIImagePNGRepresentation(creatureImageView.image)

        if (existingCreature == nil) {
        //newCreature.image = UIImagePNGRepresentation(image)

        context.save(nil)

        println("\(existingCreature)")
        }
    }

    
    @IBAction func editButtonPressed(sender: AnyObject) {
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let context: NSManagedObjectContext = appDelegate.managedObjectContext!
        if (existingCreature != nil) {
            existingCreature.setValue(updateCreateTextField.text, forKey: "name")
            existingCreature.setValue(updateCreatureDetail.text, forKey: "detail")
            var newImage = UIImagePNGRepresentation(creatureImageView.image)
            //existingCreature.setValue(newImage as NSData, forKey: "image")
            
            creatureNameLabel.text = "Creature name is \(name) and it's details are \(detail)"
            
            context.save(nil)

            updateCreateTextField.text = ""
            updateCreatureDetail.text = ""
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationItem.rightBarButtonItem = self.editButtonItem()
        creatureNameLabel.text = "Creature name is \(name) and it's details are \(detail)"
        println(detail)
        //creatureImageView.image = UIImage(named: "Icon-60.png")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewDidAppear(animated: Bool) {
        creatureNameLabel.text = "Creature name is \(name) and it's details are \(detail)"
    }

/*
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        creatureImageView.image = image
        creatureImageView.contentMode = UIViewContentMode.ScaleAspectFill
        creatureImageView.clipsToBounds = true
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func setEditing(editing: Bool, animated: Bool) {
        if (editing) {

        } else {

        }
        editButtonPressed(self)
    }
*/
}
