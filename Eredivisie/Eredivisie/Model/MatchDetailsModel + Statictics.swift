//
//  MatchDetailsModel + Statictics.swift
//  Eredivisie
//
//  Created by user on 2/7/18.
//  Copyright © 2018 vlad. All rights reserved.
//

import Foundation

protocol HaveTime {
    var timeEvent: String? {get set}
}

class GoalScorers: HaveTime {
    var timeEvent: String?
    var homeScorer: String?
    var score: String?
    var awayScorer:String?
}

class Card: HaveTime {
    var timeEvent: String?
    var homeFault: String?
    var card: String?
    var awayFault: String?
}


