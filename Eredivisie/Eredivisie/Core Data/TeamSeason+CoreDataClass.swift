//
//  TeamSeason+CoreDataClass.swift
//  Eredivisie
//
//  Created by user on 2/20/18.
//  Copyright © 2018 vlad. All rights reserved.
//
//

import Foundation
import CoreData

@objc(TeamSeason)
public class TeamSeason: NSManagedObject {

    static func create(from team: Team) -> TeamSeason {
        let teamSeason = TeamSeason(context: CoreDataStack.stack.context)
        teamSeason.teamName = team.teamName
        
        teamSeason.away = DataTable.createDataTable(from: team, mode: .away)
        teamSeason.home = DataTable.createDataTable(from: team, mode: .home)
        teamSeason.overall = DataTable.createDataTable(from: team, mode: .overall)

        return teamSeason
    }
    
    static func createFromStatistics(from statistics: Statistics) -> TeamSeason {
        let teamSeason = TeamSeason(context: CoreDataStack.stack.context)
        teamSeason.games?.adding(Games.createGames(from: statistics))
        
        return teamSeason
    }
}

