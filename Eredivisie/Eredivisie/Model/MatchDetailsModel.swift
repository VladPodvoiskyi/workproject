//
//  MatchDetailsModel.swift
//  Eredivisie
//
//  Created by user on 2/2/18.
//  Copyright © 2018 vlad. All rights reserved.
//

import Foundation

class MatchDetailsModel {
    
    var homeTeamMD: String!
    var awayTeamMD: String!
    var homeGoalsMD: String!
    var awayGoalsMD: String!
    
    init (statDict: Dictionary<String, AnyObject>) {
        
        self.homeTeamMD = statDict["match_hometeam_name"] as? String
        self.awayTeamMD = statDict["match_awayteam_name"] as? String
        self.homeGoalsMD = statDict["match_hometeam_score"] as? String
        self.awayGoalsMD = statDict["match_awayteam_score"] as? String
    }
    
}
