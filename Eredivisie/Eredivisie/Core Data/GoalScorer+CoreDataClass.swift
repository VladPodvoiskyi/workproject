//
//  GoalScorer+CoreDataClass.swift
//  Eredivisie
//
//  Created by user on 3/5/18.
//  Copyright © 2018 vlad. All rights reserved.
//
//

import Foundation
import CoreData

@objc(GoalScorer)
public class GoalScorer: NSManagedObject {
    
    static func createGoalScorer(from HaveTime: GoalScorers) -> GoalScorer {
        let goalScorer = GoalScorer(context: CoreDataStack.stack.context)
        
        goalScorer.timeEvents = HaveTime.timeEvent
        goalScorer.homeScorer = HaveTime.homeScorer
        goalScorer.awayScorer = HaveTime.awayScorer
        goalScorer.score = HaveTime.score
        
        return goalScorer
        
    }
}
