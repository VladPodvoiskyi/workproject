//
//  Games+CoreDataProperties.swift
//  Eredivisie
//
//  Created by user on 2/20/18.
//  Copyright © 2018 vlad. All rights reserved.
//
//

import Foundation
import CoreData


extension Games {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Games> {
        return NSFetchRequest<Games>(entityName: "Games")
    }

    @NSManaged public var awayTeamName: String?
    @NSManaged public var awayTeamScore: Int32
    @NSManaged public var homeTeamName: String?
    @NSManaged public var homeTeamScore: Int32
    @NSManaged public var matchDate: String?
    @NSManaged public var matchTime: String?
    @NSManaged public var cards: NSSet?
    @NSManaged public var goals: NSSet?
    @NSManaged public var season: TeamSeason?

}

// MARK: Generated accessors for cards
extension Games {

    @objc(addCardsObject:)
    @NSManaged public func addToCards(_ value: GotCards)

    @objc(removeCardsObject:)
    @NSManaged public func removeFromCards(_ value: GotCards)

    @objc(addCards:)
    @NSManaged public func addToCards(_ values: NSSet)

    @objc(removeCards:)
    @NSManaged public func removeFromCards(_ values: NSSet)

}

// MARK: Generated accessors for goals
extension Games {

    @objc(addGoalsObject:)
    @NSManaged public func addToGoals(_ value: GoalScorer)

    @objc(removeGoalsObject:)
    @NSManaged public func removeFromGoals(_ value: GoalScorer)

    @objc(addGoals:)
    @NSManaged public func addToGoals(_ values: NSSet)

    @objc(removeGoals:)
    @NSManaged public func removeFromGoals(_ values: NSSet)

}
