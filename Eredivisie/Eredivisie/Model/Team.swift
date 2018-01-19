//
//  Team.swift
//  Eredivisie
//
//  Created by user on 1/9/18.
//  Copyright © 2018 vlad. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

class Team {
    //TODO It will be deleted after add core data
    static var allTeams: [Team] = []
    
    var teamName: String!
    
    var overallPosition: Int!
    var overallMatches: Int!
    var overallWin: Int!
    var overallDraw: Int!
    var overallLose: Int!
    var overallGoalsScored: Int!
    var overallMissedGoals: Int!
    var overallPoints: Int!
    
    var homePosition: Int!
    var homeMatches: Int!
    var homeWin: Int!
    var homeDraw: Int!
    var homeLose: Int!
    var homeGoalsScored: Int!
    var homeMissedGoals: Int!
    var homePoints: Int!
    
    var awayPosition: Int!
    var awayMatches: Int!
    var awayWin: Int!
    var awayDraw: Int!
    var awayLose: Int!
    var awayGoalsScored: Int!
    var awayMissedGoals: Int!
    var awayPoints: Int!
    
    init(teamDict: Dictionary<String, AnyObject>) {
        //all parse logic
        self.teamName = teamDict["team_name"] as? String
        
//        self.overallPosition = Int(teamDict["overall_league_position"] as? String ?? "")
        self.overallMatches = Int(teamDict["overall_league_payed"] as? String ?? "")
        self.overallWin = Int(teamDict["overall_league_W"] as? String ?? "")
        self.overallDraw = Int(teamDict["overall_league_D"] as? String ?? "")
        self.overallLose = Int(teamDict["overall_league_L"] as? String ?? "")
        self.overallGoalsScored = Int(teamDict["overall_league_GF"] as? String ?? "")
        self.overallMissedGoals = Int(teamDict["overall_league_GA"] as? String ?? "")
        self.overallPoints = Int(teamDict["overall_league_PTS"] as? String ?? "")
        
//        self.homePosition = Int(teamDict["home_league_position"] as? String ?? "")
        self.homeMatches = Int(teamDict["home_league_payed"] as? String ?? "")
        self.homeWin = Int(teamDict["home_league_W"] as? String ?? "")
        self.homeDraw = Int(teamDict["home_league_D"] as? String ?? "")
        self.homeLose = Int(teamDict["home_league_L"] as? String ?? "")
        self.homeGoalsScored = Int(teamDict["home_league_GF"] as? String ?? "")
        self.homeMissedGoals = Int(teamDict["home_league_GA"] as? String ?? "")
        self.homePoints = Int(teamDict["home_league_PTS"] as? String ?? "")
        
//        self.awayPosition = Int(teamDict["away_league_position"] as? String ?? "")
        self.awayMatches = Int(teamDict["away_league_payed"] as? String ?? "")
        self.awayWin = Int(teamDict["away_league_W"] as? String ?? "")
        self.awayDraw = Int(teamDict["away_league_D"] as? String ?? "")
        self.awayLose = Int(teamDict["away_league_L"] as? String ?? "")
        self.awayGoalsScored = Int(teamDict["away_league_GF"] as? String ?? "")
        self.awayMissedGoals = Int(teamDict["away_league_GA"] as? String ?? "")
        self.awayPoints = Int(teamDict["away_league_PTS"] as? String ?? "")
        
    }
    
    static func fetchTeams(handler: @escaping () -> Void) {
        let getTableURL = URL(string: GET_TABLE_URL)!
        
        Alamofire.SessionManager.default.requestWithoutCache(getTableURL).responseJSON { (response) in
            let result = response.result
            if let dictLeague = result.value as? [Dictionary<String, AnyObject>] {
                for dictTeam in dictLeague {
                    let team = Team(teamDict: dictTeam)
                    Team.allTeams.append(team)
                }
    
                handler()
            }
        }
    }
}
