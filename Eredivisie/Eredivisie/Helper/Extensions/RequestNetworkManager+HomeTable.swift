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
                    parseEventsNew(dict: dictStat, complition: { (arrayHaveTime) in
                        statistics.events = arrayHaveTime
                    })
                    Statistics.allStatistics.append(statistics)
                }
                handler()
            }
        }
    }
    
    static func parseEventsNew(dict: [String: AnyObject], complition: (([HaveTime]) -> Void)) {
        var arrayEvents = [HaveTime]()
            
            if let goalscorerInNet = dict["goalscorer"] as? [[String: AnyObject]] {
                
                // fill array of score
                for goalScorer in goalscorerInNet {
                    let goalscorer = GoalScorer()
                    if let time = goalScorer["time"] as? String {
                        goalscorer.time = time
                    }
                    if let score = goalScorer["score"] as? String {
                        goalscorer.score = score
                    }
                    if let homeScorer = goalScorer["home_scorer"] as? String {
                        goalscorer.homeScorer = homeScorer
                    }
                    if let awayScore = goalScorer["away_scorer"] as? String {
                        goalscorer.awayScorer = awayScore
                    }
                    arrayEvents.append(goalscorer)
                }
            }
        
        if let cardsInNet = dict["cards"] as? [[String: AnyObject]] {
            
            //fill array of score
            for card in cardsInNet {
                let cardScorer = Card()
                if let time = card["time"] as? String {
                    cardScorer.time = time
                }
                if let homeFault = card["home_fault"] as? String {
                    cardScorer.homeFault = homeFault
                }
                if let cardGet = card["card"] as? String {
                    cardScorer.card = cardGet
                }
                if let awayFault = card["away_fault"] as? String {
                    cardScorer.awayFault = awayFault
                }
                arrayEvents.append(cardScorer)
            }
        }
        
        complition(arrayEvents)
    }
}

//https://apifootball.com/api/?


//func fetchEvents(completion: ([])) {
//    static let ACTION = "action="
//    static let LEAGUE_ID = "league_id="
//    static let DATE_FROM = "from="
//    static let DATE_TO = "to="
//}
//// With Alamofire
//func fetchAllRooms(completion: ([RemoteRoom]?) -> Void) {
//let dictionary = ["ACTION": "action=", "get_events": "get_events&", "date_from": "from=2017-08-01&", "date_to": "to=2018-06-01&,]
//    Alamofire.request(
//        .GET,
//        "http://localhost:5984/rooms/_all_docs",
//        parameters: ["include_docs": "true", "action": "ACTION", "get_events": "get_events&"],
//        encoding: .URL)
//        .validate()
//        .responseJSON { (response) -> Void in
//            guard response.result.isSuccess else {
//                print("Error while fetching remote rooms: \(response.result.error)")
//                completion(nil)
//                return
//            }
//
//            guard let value = response.result.value as? [String: AnyObject],
//                rows = value["rows"] as? [[String: AnyObject]] else {
//                    print("Malformed data received from fetchAllRooms service")
//                    completion(nil)
//                    return
//            }
//
//            var rooms = [RemoteRoom]()
//            for roomDict in rows {
//                rooms.append(RemoteRoom(jsonData: roomDict))
//            }
//
//            completion(rooms)
//    }
//}

