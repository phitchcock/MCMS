//
//  ViewController.swift
//  MCMS
//
//  Created by Peter Hitchcock on 10/7/14.
//  Copyright (c) 2014 Peter Hitchcock. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var creatures: [AnyObject] = []

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var creatureTextField: UITextField!

    @IBAction func addCreatureButton(sender: AnyObject) {
        setData()
        getData()
        creatureTextField.text = ""
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return creatures.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("dCell", forIndexPath: indexPath) as UITableViewCell
        var data: NSManagedObject = creatures[indexPath.row] as NSManagedObject
        var name = data.valueForKey("name") as String
        cell.textLabel?.text = data.valueForKey("name") as? String
        return cell

    }

    func setData() {
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let context: NSManagedObjectContext = appDelegate.managedObjectContext!
        let entityList = NSEntityDescription.entityForName("MagicalCreature", inManagedObjectContext: context)
        var newCreature = MagicalCreature(entity: entityList!, insertIntoManagedObjectContext: context)
        newCreature.name = creatureTextField.text

        var e: NSError?
        context.save(&e)
    }

    func getData() {
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let context: NSManagedObjectContext = appDelegate.managedObjectContext!
        let fetchRequest = NSFetchRequest(entityName: "MagicalCreature")
        creatures = context.executeFetchRequest(fetchRequest, error: nil)!
        tableView.reloadData()

    }

    override func viewWillAppear(animated: Bool) {
        getData()
    }


}

