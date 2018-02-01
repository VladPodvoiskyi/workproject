//
//  RequestNetworkManager+Table.swift
//  Eredivisie
//
//  Created by user on 1/30/18.
//  Copyright © 2018 vlad. All rights reserved.
//

import Foundation
import Alamofire

extension RequestNetworkManager {
        
    static func fetchTeams(leagueID: String, handler: @escaping () -> Void) {
        let url = URL(string: RequestNetworkManager.createURL(withParameters: ACTION + "get_standings" + "&" + LEAGUE_ID + leagueID))
        Alamofire.SessionManager.default.requestWithoutCache(url!).responseJSON { (response) in
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
