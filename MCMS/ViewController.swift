//
//  ViewController.swift
//  MCMS
//
//  Created by Peter Hitchcock on 10/7/14.
//  Copyright (c) 2014 Peter Hitchcock. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {

    var creatures: [AnyObject] = []
    //var accessories: [AnyObject] = []

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var creatureTextField: UITextField!
    @IBOutlet weak var detailTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewWillAppear(animated: Bool) {
        getData()
    }

    @IBAction func addCreatureButtonPressed(sender: AnyObject) {
        setData()
        getData()
        detailTextField.endEditing(true)
        creatureTextField.text = ""
        detailTextField.text = ""
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return creatures.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: CreatureTableViewCell = tableView.dequeueReusableCellWithIdentifier("dCell", forIndexPath: indexPath) as CreatureTableViewCell
        var data: NSManagedObject = creatures[indexPath.row] as NSManagedObject
        //var dataAccessory: NSManagedObject = accessories[indexPath.row] as NSManagedObject

        var name = data.valueForKey("name") as? String
        var detail = data.valueForKey("detail") as? String
        //var accessory = dataAccessory.valueForKey("kind") as? String

        cell.creatureNameLabel.text = data.valueForKey("name") as? String
        cell.creatureDetailLabel.text = data.valueForKey("detail") as? String
        //cell.creatureAccessoryLabel.text = accessory
        //cell.creatureImage.image = UIImage(data: )
        return cell

    }

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let context: NSManagedObjectContext = appDelegate.managedObjectContext!
        if editingStyle == UITableViewCellEditingStyle.Delete {
            context.deleteObject((self.creatures[indexPath.row] as NSManagedObject))
            self.creatures.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
            var error: NSError? = nil
            if !context.save(&error) {
                abort()
            }
        }
    }

    func setData() {
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let context: NSManagedObjectContext = appDelegate.managedObjectContext!
        let entityList = NSEntityDescription.entityForName("MagicalCreature", inManagedObjectContext: context)
        //let entityAccessory = NSEntityDescription.entityForName("Accessorie", inManagedObjectContext: context)
        var newCreature = MagicalCreature(entity: entityList!, insertIntoManagedObjectContext: context)
        //var newCreatureAccessory = Accessorie(entity: entityAccessory!, insertIntoManagedObjectContext: context)
        newCreature.name = creatureTextField.text
        newCreature.detail = detailTextField.text
        //newCreature.setValue(newCreatureAccessory, forKeyPath: "Accessorie")
        //var changeData:NSData = accessoriesTextField.text as NSData
        //newCreature.accessories.append(changeData)
        var e: NSError?
        context.save(&e)
        //print("\(newCreatureAccessory)")
    }

    func getData() {
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let context: NSManagedObjectContext = appDelegate.managedObjectContext!
        let fetchRequest = NSFetchRequest(entityName: "MagicalCreature")
        creatures = context.executeFetchRequest(fetchRequest, error: nil)!
        tableView.reloadData()

    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var showVC = segue.destinationViewController as ShowViewController
        if (segue.identifier == "show") {
            var selectedItem: NSManagedObject = creatures[self.tableView.indexPathForSelectedRow()!.row] as NSManagedObject
            showVC.name = selectedItem.valueForKey("name") as String
            showVC.detail = selectedItem.valueForKey("detail") as String
            //showVC.image = selectedItem.valueForKey("image") as? UIImage
            showVC.title = showVC.name
            showVC.existingCreature = selectedItem
            println("\(showVC.existingCreature)")
        }
    }

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
}

