//
//  ShowViewController.swift
//  MCMS
//
//  Created by Peter Hitchcock on 10/7/14.
//  Copyright (c) 2014 Peter Hitchcock. All rights reserved.
//

import UIKit
import CoreData

class ShowViewController: UIViewController {

    var name:String!
    var existingCreature:NSManagedObject!

    @IBOutlet weak var creatureNameLabel: UILabel!
    @IBOutlet weak var updateCreateTextField: UITextField!
    
    @IBAction func editButtonPressed(sender: AnyObject) {
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let context: NSManagedObjectContext = appDelegate.managedObjectContext!
        if (existingCreature != nil) {
            existingCreature.setValue(updateCreateTextField.text, forKey: "name")
            creatureNameLabel.text = updateCreateTextField.text
            context.save(nil)
            updateCreateTextField.text = ""
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        creatureNameLabel.text = name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
