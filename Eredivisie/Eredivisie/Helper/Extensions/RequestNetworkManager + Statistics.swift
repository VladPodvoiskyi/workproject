//
//  RequestNetworkManager + Statistics.swift
//  Eredivisie
//
//  Created by user on 2/7/18.
//  Copyright © 2018 vlad. All rights reserved.
//

import Foundation
import Alamofire


extension RequestNetworkManager {
    
    static func fetchEventsNew(dateFrom: String, dateTo: String, leagueID: String, handler: @escaping () -> Void ) {
        let url = URL(string: "https://apifootball.com/api/?action=get_events&from=2017-08-01&to=2018-06-01&league_id=137&APIkey=9f4888d8b7f21dac93a851d0c291266fe884da492fba995dbdf59789347e913d")
        Alamofire.SessionManager.default.requestWithoutCache(url!).responseJSON { (response) in
            let result = response.result
            if let dictLeague = result.value as? [[String: AnyObject]] {
                for dictStat in dictLeague {
                    var arrayScorer = [HaveTime]()
                    
                    if let goalscorerInNet = dictStat["goalscorer"] as? [[String: AnyObject]] {
                        
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
                            arrayScorer.append(goalscorer)
                        }
                    }
                }
                handler()
            }
        }
    }
}
