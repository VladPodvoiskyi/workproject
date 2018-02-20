//
//  GotCards+CoreDataProperties.swift
//  Eredivisie
//
//  Created by user on 2/20/18.
//  Copyright © 2018 vlad. All rights reserved.
//
//

import Foundation
import CoreData


extension GotCards {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GotCards> {
        return NSFetchRequest<GotCards>(entityName: "GotCards")
    }

    @NSManaged public var awayFault: String?
    @NSManaged public var card: String?
    @NSManaged public var homeFault: String?
    @NSManaged public var timeEvent: Int32
    @NSManaged public var game: Games?

}
