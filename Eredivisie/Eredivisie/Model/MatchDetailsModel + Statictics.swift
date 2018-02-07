//
//  MatchDetailsModel + Statictics.swift
//  Eredivisie
//
//  Created by user on 2/7/18.
//  Copyright © 2018 vlad. All rights reserved.
//

import Foundation

protocol HaveTime {
    var time: String? {get set}
}

class GoalScorer: HaveTime {
    var time: String? {
        get {
            return self.time
        }
        
        set {
        
        }
    }
    var homeScorer: String?
    var score: String?
    var awayScorer:String?
}

class Card: HaveTime {
    var time: String? {
        get {
            return self.time
        }
        
        set {
            
        }
    }
    var homeFault: String?
    var card: String?
    var awayFault: String?
}


