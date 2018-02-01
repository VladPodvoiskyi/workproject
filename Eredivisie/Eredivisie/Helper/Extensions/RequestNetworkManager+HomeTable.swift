//
//  RequestNetworkManager+HomeTable.swift
//  Eredivisie
//
//  Created by user on 1/30/18.
//  Copyright © 2018 vlad. All rights reserved.
//

import Foundation
import Alamofire

extension RequestNetworkManager {
    
    static func fetchEvents(dateFrom: String, dateTo: String, leagueID: String, handler: @escaping () -> Void ) {
        let url = URL(string: RequestNetworkManager.createURL(withParameters: ACTION + "get_events" + "&" + DATE_FROM + dateFrom + "&" + DATE_TO + dateTo + "&" + LEAGUE_ID + leagueID))
        Alamofire.SessionManager.default.requestWithoutCache(url!).responseJSON { (response) in
            let result = response.result
            if let dictLeague = result.value as? [Dictionary<String, AnyObject>] {
                for dictStat in dictLeague {
                    let statistics = Statistics(statDict: dictStat)
                    Statistics.allStatistics.append(statistics)
                }
                handler()
            }
        }
    }
}

//https://apifootball.com/api/?action=get_events&from=2017-08-01&to=2018-06-01&league_id=137&APIkey=9f4888d8b7f21dac93a851d0c291266fe884da492fba995dbdf59789347e913d
