//
//  CreatureTableViewCell.swift
//  MCMS
//
//  Created by Peter Hitchcock on 10/7/14.
//  Copyright (c) 2014 Peter Hitchcock. All rights reserved.
//

import UIKit

class CreatureTableViewCell: UITableViewCell {

    @IBOutlet weak var creatureNameLabel: UILabel!
    @IBOutlet weak var creatureDetailLabel: UILabel!
    @IBOutlet weak var creatureImage: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
