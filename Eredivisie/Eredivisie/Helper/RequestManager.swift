//
//  RequestManager.swift
//  Eredivisie
//
//  Created by user on 1/30/18.
//  Copyright © 2018 vlad. All rights reserved.
//

import Foundation
import Alamofire

class RequestNetworkManager {
    static let baseURL = "https://apifootball.com/api/?"
    static let ACTION = "action="
    static let LEAGUE_ID = "league_id="
    static let DATE_FROM = "from="
    static let DATE_TO = "to="
    static let API_KEY = "&APIkey=9f4888d8b7f21dac93a851d0c291266fe884da492fba995dbdf59789347e913d"
    
    static func createURL(withParameters parametrs: String) -> String {
        return baseURL + parametrs + API_KEY
    }
}
