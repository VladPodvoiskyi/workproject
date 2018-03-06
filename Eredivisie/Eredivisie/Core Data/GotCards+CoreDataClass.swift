//
//  GotCards+CoreDataClass.swift
//  Eredivisie
//
//  Created by user on 3/5/18.
//  Copyright © 2018 vlad. All rights reserved.
//
//

import Foundation
import CoreData

@objc(GotCards)
public class GotCards: NSManagedObject {
    
    static func createGotCards(from HaveTime: Card) -> GotCards {
        let gotCards = GotCards(context: CoreDataStack.stack.context)
        
        gotCards.timeEvent = HaveTime.timeEvent
        gotCards.homeFault = HaveTime.homeFault
        gotCards.awayFault = HaveTime.awayFault
        gotCards.card = HaveTime.card
        
        return gotCards
    }
}
