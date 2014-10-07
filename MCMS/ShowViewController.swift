//
//  ShowViewController.swift
//  MCMS
//
//  Created by Peter Hitchcock on 10/7/14.
//  Copyright (c) 2014 Peter Hitchcock. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController {

    var name:String!

    @IBOutlet weak var creatureNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creatureNameLabel.text = name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
