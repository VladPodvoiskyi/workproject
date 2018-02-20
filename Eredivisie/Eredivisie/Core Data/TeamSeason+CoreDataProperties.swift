//
//  TeamSeason+CoreDataProperties.swift
//  Eredivisie
//
//  Created by user on 2/20/18.
//  Copyright © 2018 vlad. All rights reserved.
//
//

import Foundation
import CoreData


extension TeamSeason {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TeamSeason> {
        return NSFetchRequest<TeamSeason>(entityName: "TeamSeason")
    }

    @NSManaged public var away: Int32
    @NSManaged public var home: Int32
    @NSManaged public var overall: Int32
    @NSManaged public var teamName: String?
    @NSManaged public var dataTable: Set<DataTable>
    @NSManaged public var games: Set<Games>

}

// MARK: Generated accessors for dataTable
extension TeamSeason {

    @objc(addDataTableObject:)
    @NSManaged public func addToDataTable(_ value: DataTable)

    @objc(removeDataTableObject:)
    @NSManaged public func removeFromDataTable(_ value: DataTable)

    @objc(addDataTable:)
    @NSManaged public func addToDataTable(_ values: NSSet)

    @objc(removeDataTable:)
    @NSManaged public func removeFromDataTable(_ values: NSSet)

}

// MARK: Generated accessors for games
extension TeamSeason {

    @objc(addGamesObject:)
    @NSManaged public func addToGames(_ value: Games)

    @objc(removeGamesObject:)
    @NSManaged public func removeFromGames(_ value: Games)

    @objc(addGames:)
    @NSManaged public func addToGames(_ values: NSSet)

    @objc(removeGames:)
    @NSManaged public func removeFromGames(_ values: NSSet)

}
