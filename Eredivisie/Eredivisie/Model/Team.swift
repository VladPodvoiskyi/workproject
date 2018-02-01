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

enum Mode: Int {
    case home = 0
    case overall = 1
    case away = 2
}

class Team {
    //TODO It will be deleted after add core data
    static var allTeams: [Team] = []
    
    var teamName: String = ""
    
    var overallPosition: Int!
    var overallMatches = 0
    var overallWin = 0
    var overallDraw = 0
    var overallLose = 0
    var overallGoalsScored = 0
    var overallMissedGoals = 0
    var overallPoints = 0
    
    var homePosition = 0
    var homeMatches = 0
    var homeWin = 0
    var homeDraw = 0
    var homeLose = 0
    var homeGoalsScored = 0
    var homeMissedGoals = 0
    var homePoints = 0
    
    var awayPosition = 0
    var awayMatches = 0
    var awayWin = 0
    var awayDraw = 0
    var awayLose = 0
    var awayGoalsScored = 0
    var awayMissedGoals = 0
    var awayPoints = 0
    
    init(teamDict: Dictionary<String, AnyObject>) {
        //all parse logic
        self.teamName = (teamDict["team_name"] as? String)!
        
//        self.overallPosition = Int(teamDict["overall_league_position"] as? String ?? "")
        
        if let overallLeaguePayed = Int(teamDict["overall_league_payed"] as! String) {
            self.overallMatches = overallLeaguePayed
        }
        
        if let overallLeagueW = Int(teamDict["overall_league_W"] as! String) {
            self.overallWin = overallLeagueW
        }
        
        if let overallLeagueD = Int(teamDict["overall_league_D"] as! String) {
            self.overallDraw = overallLeagueD
        }

        if let overallLeagueL = Int (teamDict["overall_league_L"] as! String) {
            self.overallLose = overallLeagueL
        }
        
        if let overall_league_GF = Int(teamDict["overall_league_GF"] as! String) {
            self.overallGoalsScored = overall_league_GF
        }
        
        if let overallLeagueGA = Int(teamDict["overall_league_GA"] as! String) {
            self.overallMissedGoals = overallLeagueGA
        }
        
        if let overall_league_PTS = Int(teamDict["overall_league_PTS"] as! String) {
            self.overallPoints = overall_league_PTS
        }
        
        
//        self.homePosition = Int(teamDict["home_league_position"] as? String ?? "")
        
        if let homeLeaguePayed = Int(teamDict["home_league_payed"] as! String) {
            self.homeMatches = homeLeaguePayed
        }
        
        if let homeLeagueW = Int(teamDict["home_league_W"] as! String) {
            self.homeWin = homeLeagueW
        }
        
        if let homeLeagueD = Int(teamDict["home_league_D"] as! String) {
            self.homeDraw = homeLeagueD
        }
        
        if let homeLeagueL = Int(teamDict["home_league_L"] as! String) {
            self.homeLose = homeLeagueL
        }
        
        if let homeLeagueGF = Int(teamDict["home_league_GF"] as! String) {
            self.homeGoalsScored = homeLeagueGF
        }
        
        if let homeLeagueGA = Int(teamDict["home_league_GA"] as! String) {
            self.homeMissedGoals = homeLeagueGA
        }
        
        if let homeLeaguePTS = Int(teamDict["home_league_PTS"] as! String) {
            self.homePoints = homeLeaguePTS
        }
        
//        self.awayPosition = Int(teamDict["away_league_position"] as? String ?? "")
        
        if let awayLeaguePayed = Int(teamDict["away_league_payed"] as! String) {
            self.awayMatches = awayLeaguePayed
        }
        
        if let awayLeagueW = Int(teamDict["away_league_W"] as! String) {
            self.awayWin = awayLeagueW
        }
        
        if let awayLeagueD = Int(teamDict["away_league_D"] as! String) {
            self.awayDraw = awayLeagueD
        }
        
        if let awayLeagueL = Int(teamDict["away_league_L"] as! String) {
            self.awayLose = awayLeagueL
        }
        
        if let awayLeagueGF = Int(teamDict["away_league_GF"] as! String) {
            self.awayGoalsScored = awayLeagueGF
        }
        
        if let awayLeagueGA = Int(teamDict["away_league_GA"] as! String) {
            self.awayMissedGoals = awayLeagueGA
        }
        
        if let awayLeaguePTS = Int(teamDict["away_league_PTS"] as! String) {
            self.awayPoints = awayLeaguePTS
        }
    }
    
    func createViewModel(with mode: Mode) -> TeamViewModel {
        let viewModel = TeamViewModel()
        viewModel.team = self.teamName
        switch mode {
        case .home:
            viewModel.game = self.homeMatches
            viewModel.win = self.homeWin
            viewModel.draw = self.homeDraw
            viewModel.lose = self.homeLose
            viewModel.goalsScored = self.homeGoalsScored
            viewModel.missedGoals = self.homeMissedGoals
            viewModel.points = self.homePoints
            
        case .overall:
            viewModel.game = self.overallMatches
            viewModel.win = self.overallWin
            viewModel.draw = self.overallDraw
            viewModel.lose = self.overallLose
            viewModel.goalsScored = self.overallGoalsScored
            viewModel.missedGoals = self.overallMissedGoals
            viewModel.points = self.overallPoints
            
        case .away:
            viewModel.game = self.awayMatches
            viewModel.win = self.awayWin
            viewModel.draw = self.awayDraw
            viewModel.lose = self.awayLose
            viewModel.goalsScored = self.awayGoalsScored
            viewModel.missedGoals = self.awayMissedGoals
            viewModel.points = self.awayPoints
        }
        return viewModel
    }
    
//    static func fetchTeams(handler: @escaping () -> Void) {
//        let getTableURL = URL(string: GET_TABLE_URL)!
//        Alamofire.SessionManager.default.requestWithoutCache(getTableURL).responseJSON { (response) in
//            let result = response.result
//            if let dictLeague = result.value as? [Dictionary<String, AnyObject>] {
//                for dictTeam in dictLeague {
//                    let team = Team(teamDict: dictTeam)
//                    Team.allTeams.append(team)
//                }
//
//                handler()
//            }
//        }
//    }
}
