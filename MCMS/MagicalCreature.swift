//
//  MagicalCreature.swift
//  MCMS
//
//  Created by Peter Hitchcock on 10/7/14.
//  Copyright (c) 2014 Peter Hitchcock. All rights reserved.
//

import Foundation
import CoreData

class MagicalCreature: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var detail: String
    @NSManaged var image: NSData
    @NSManaged var accessories: NSSet

}
