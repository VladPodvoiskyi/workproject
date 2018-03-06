//
//  DataTable+CoreDataClass.swift
//  Eredivisie
//
//  Created by user on 2/20/18.
//  Copyright © 2018 vlad. All rights reserved.
//
//

import Foundation
import CoreData

enum ModeDataTable: String {
    case home
    case overall
    case away
}

@objc(DataTable)
public class DataTable: NSManagedObject {
    
    static func createDataTable(from team: Team, mode: Mode) -> DataTable {
    let dataTable = DataTable(context: CoreDataStack.stack.context)
        
        switch mode {
        case .home:
        dataTable.position = Int32(team.homePosition)
        dataTable.playedMatches = Int32(team.homeMatches)
        dataTable.win = Int32(team.homeWin)
        dataTable.draw = Int32(team.homeDraw)
        dataTable.lose = Int32(team.homeLose)
        dataTable.goalsScored = Int32(team.homeGoalsScored)
        dataTable.goalsMissed = Int32(team.homeMissedGoals)
        dataTable.points = Int32(team.homePoints)
            
        case .overall:
        dataTable.position = Int32(team.overallPosition)
        dataTable.playedMatches = Int32(team.overallMatches)
        dataTable.win = Int32(team.overallWin)
        dataTable.draw = Int32(team.overallDraw)
        dataTable.lose = Int32(team.overallLose)
        dataTable.goalsScored = Int32(team.overallGoalsScored)
        dataTable.goalsMissed = Int32(team.overallMissedGoals)
        dataTable.points = Int32(team.overallPoints)
            
        case .away:
        dataTable.position = Int32(team.awayPosition)
        dataTable.playedMatches = Int32(team.awayMatches)
        dataTable.win = Int32(team.awayWin)
        dataTable.draw = Int32(team.awayDraw)
        dataTable.lose = Int32(team.awayLose)
        dataTable.goalsScored = Int32(team.awayGoalsScored)
        dataTable.goalsMissed = Int32(team.awayMissedGoals)
        dataTable.points = Int32(team.awayPoints)
        }
        return dataTable
        }
}

