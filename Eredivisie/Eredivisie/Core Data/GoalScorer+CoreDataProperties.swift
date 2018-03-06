//
//  GoalScorer+CoreDataProperties.swift
//  Eredivisie
//
//  Created by user on 3/5/18.
//  Copyright © 2018 vlad. All rights reserved.
//
//

import Foundation
import CoreData


extension GoalScorer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GoalScorer> {
        return NSFetchRequest<GoalScorer>(entityName: "GoalScorer")
    }

    @NSManaged public var awayScorer: String?
    @NSManaged public var homeScorer: String?
    @NSManaged public var score: String?
    @NSManaged public var timeEvents: String?
    @NSManaged public var game: Games?

}
