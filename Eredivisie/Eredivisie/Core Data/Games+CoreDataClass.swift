//
//  Games+CoreDataClass.swift
//  Eredivisie
//
//  Created by user on 2/20/18.
//  Copyright © 2018 vlad. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Games)
public class Games: NSManagedObject {
    
    static func createGames(from statistics: Statistics) -> Games {
        let games = Games(context: CoreDataStack.stack.context)
        
        games.homeTeamName = statistics.homeTeamName
        games.awayTeamName = statistics.awayTeamName
        if let homeGoals = statistics.homeTeamScore {
            games.homeTeamScore = Int32(homeGoals)
        }
        if let awayGoal = statistics.awayTeamScore{
            games.homeTeamScore = Int32(awayGoal)
        }
        games.matchTime = statistics.matchTime
        games.matchDate = statistics.date
        
        return games
    }
    
    func addGoals(goals: GoalScorer) {
        self.goals?.adding(goals)
    }
    
    func addCard(cards: GotCards) {
        self.cards?.adding(cards)
    }
}


