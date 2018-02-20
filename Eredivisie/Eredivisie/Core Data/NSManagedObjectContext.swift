//
//  NSManagedObjectContext.swift
//  Eredivisie
//
//  Created by user on 2/20/18.
//  Copyright © 2018 vlad. All rights reserved.
//

import Foundation
import CoreData

extension NSManagedObjectContext {
    
    private func saveContext () {
        if self.hasChanges {
            do {
                try save()
            } catch let error {
                let nserror = error as NSError
                print("Core Data Error: \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
}
    

