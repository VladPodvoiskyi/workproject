//
//  Constants.swift
//  Eredivisie
//
//  Created by user on 1/9/18.
//  Copyright © 2018 vlad. All rights reserved.
//

import Foundation


let BASE_URL = "https://apifootball.com/api/?"
let ACTION = "action="
let LEAGUE_ID = "&league_id="
let API_KEY = "&APIkey=9f4888d8b7f21dac93a851d0c291266fe884da492fba995dbdf59789347e913d"

typealias DownloadComplete = () -> Void

let GET_TABLE_URL = BASE_URL + ACTION + "get_standings" + LEAGUE_ID + String(137) + API_KEY
