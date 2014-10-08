//
//  Accessories.swift
//  MCMS
//
//  Created by Peter Hitchcock on 10/7/14.
//  Copyright (c) 2014 Peter Hitchcock. All rights reserved.
//

import Foundation
import CoreData

class Accessorie: NSManagedObject {

    @NSManaged var kind: String
    @NSManaged var magicalCreatures: NSSet

}
