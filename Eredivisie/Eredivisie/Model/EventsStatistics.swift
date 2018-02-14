//
//  EventsStatistics.swift
//  Eredivisie
//
//  Created by user on 2/12/18.
//  Copyright © 2018 vlad. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

class EventsStatistics {
    
    static var allStatistics: [EventsStatistics] = []
    
    var date: String!
    var matchStatus: String!
    var matchTime: String!
    var homeTeamName: String!
    var awayTeamName: String!
    var homeTeamScore: Int!
    var awayTeamScore: Int!
    //  var homeTeamHalfTimeScore: Int!
    // var awayTeamHalfTimeScore: Int!
    var events: [HaveTime]!
    
    init (statDict: Dictionary<String, AnyObject>) {
        self.date = statDict["match_date"] as? String
        self.matchStatus = statDict["match_status"] as? String
        self.matchTime = statDict["match_time"] as? String
        self.homeTeamName = statDict["match_hometeam_name"] as? String
        self.awayTeamName = statDict["match_awayteam_name"] as? String
        self.homeTeamScore = Int(statDict["match_hometeam_score"] as? String ?? "")
        self.awayTeamScore = Int(statDict["match_awayteam_score"] as? String ?? "")
        
    }
    
}
