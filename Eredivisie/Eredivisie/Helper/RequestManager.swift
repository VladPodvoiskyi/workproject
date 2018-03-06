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
    static let API_KEY = "&APIkey=78931cad5686a3f995869af181577b7dc94f41fd897963c93729e41e7353d0f5"
    

    
    static func createURL(withParameters parametrs: String) -> String {
        return baseURL + parametrs + API_KEY
    }
}
