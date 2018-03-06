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

    @NSManaged public var teamName: String?
    @NSManaged public var games: NSSet?
    @NSManaged public var away: DataTable?
    @NSManaged public var home: DataTable?
    @NSManaged public var overall: DataTable?

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
