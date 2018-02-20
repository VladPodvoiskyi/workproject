//
//  DataTable+CoreDataProperties.swift
//  Eredivisie
//
//  Created by user on 2/20/18.
//  Copyright © 2018 vlad. All rights reserved.
//
//

import Foundation
import CoreData


extension DataTable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DataTable> {
        return NSFetchRequest<DataTable>(entityName: "DataTable")
    }

    @NSManaged public var draw: Int32
    @NSManaged public var goalsMissed: Int32
    @NSManaged public var goalsScored: Int32
    @NSManaged public var lose: Int32
    @NSManaged public var playedMatches: Int32
    @NSManaged public var points: Int32
    @NSManaged public var position: Int32
    @NSManaged public var win: Int32
    @NSManaged public var season: TeamSeason?

}
