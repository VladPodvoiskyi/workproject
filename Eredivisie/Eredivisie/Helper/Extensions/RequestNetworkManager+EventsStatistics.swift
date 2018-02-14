//
//  RequestNetworkManager+EventsStatistics.swift
//  Eredivisie
//
//  Created by user on 2/12/18.
//  Copyright © 2018 vlad. All rights reserved.
//

import Foundation
import Alamofire

extension RequestNetworkManager {
    
    static func convertToURLEventsView(Dict: [String: String]) -> String {
        var url = ""
        for (urlParam, urlValue) in Dict {
            let paramAndValue = urlParam + urlValue + "&"
            url += paramAndValue
        }
        url = baseURL + url + API_KEY
        return url
    }
    
    static func fetchEventsView(dateFrom: String, dateTo: String, leagueID: String, handler: @escaping () -> Void ) {

        let dictURL = ["action=" : "get_events", "from=" : "2017-08-01", "to=" : "2018-06-01", "league_id=" : "137"]

        
        Alamofire.SessionManager.default.requestWithoutCache(convertToURL(Dict: dictURL)).responseJSON { (response) in
            let result = response.result
            if let dictLeague = result.value as? [Dictionary<String, AnyObject>] {
                for dictStat in dictLeague {
                    let statistics = EventsStatistics(statDict: dictStat)
                    parseEventsNew(dict: dictStat, complition: { (arrayHaveTime) in
                        statistics.events = arrayHaveTime
                    })
                    EventsStatistics.allStatistics.append(statistics)
                }
                handler()
            }
        }
}
}
