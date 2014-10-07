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
    var detail:String!
    var existingCreature:NSManagedObject!

    @IBOutlet weak var creatureNameLabel: UILabel!
    @IBOutlet weak var updateCreateTextField: UITextField!
    @IBOutlet weak var creatureDetailsLabel: UILabel!
    @IBOutlet weak var updateCreatureDetail: UITextField!
    
    @IBAction func editButtonPressed(sender: AnyObject) {
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let context: NSManagedObjectContext = appDelegate.managedObjectContext!
        if (existingCreature != nil) {
            existingCreature.setValue(updateCreateTextField.text, forKey: "name")
            existingCreature.setValue(updateCreatureDetail.text, forKey: "detail")
            creatureNameLabel.text = updateCreateTextField.text
            creatureDetailsLabel.text = updateCreatureDetail.text

            context.save(nil)
            updateCreateTextField.text = ""
            updateCreatureDetail.text = ""
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        creatureNameLabel.text = name
        creatureDetailsLabel.text = detail
        println(detail)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func setEditing(editing: Bool, animated: Bool) {
        if (editing) {

        } else {

        }
        editButtonPressed(self)
    }

}
