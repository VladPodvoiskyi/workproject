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
    
    static func convertToURL(Dict: [String: String]) -> String {
        var url = ""
        for (urlParam, urlValue) in Dict {
            let paramAndValue = urlParam + urlValue + "&"
            url += paramAndValue
        }
        url = baseURL + url + API_KEY
        return url
    }
    
    static func fetchEvents(dateFrom: String, dateTo: String, leagueID: String, handler: @escaping () -> Void ) {
 //       let dictURL = ["action=": "get_events", "date_from=": "2017-08-01", "date_to=": "2018-06-01", "league_id=": "137"]
//        let url = URL(string: RequestNetworkManager.createURL(withParameters: ACTION + "get_events" + "&" + DATE_FROM + dateFrom + "&" + DATE_TO + dateTo + "&" + LEAGUE_ID + leagueID))
        
        let dictURL = ["action=" : "get_events", "from=" : "2017-08-01", "to=" : "2018-06-01", "league_id=" : "137"]
        
//        func convertToURL(Dict: [String: String]) -> String {
//            var url = ""
//            for (urlParam, urlValue) in Dict {
//                let paramAndValue = urlParam + urlValue + "&"
//                url += paramAndValue
//            }
//            url = baseURL + url + API_KEY
//            return url
//        }
        
//        print(convertToURL(Dict: dictURL))
        
        Alamofire.SessionManager.default.requestWithoutCache(convertToURL(Dict: dictURL)).responseJSON { (response) in
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
                    let goalscorer = GoalScorers()
                    if let time = goalScorer["time"] as? String {
                        goalscorer.timeEvent = time
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
                    cardScorer.timeEvent = time
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

//https://apifootball.com/api/?action=get_events&from=2017-08-01&to=2018-06-01&league_id=137&APIkey=9f4888d8b7f21dac93a851d0c291266fe884da492fba995dbdf59789347e913d

