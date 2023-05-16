//
//  CoreDataViewModel.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/16/23.
//

import Foundation
import CoreData

final class CoreDataViewModel: ObservableObject {
    // as we're using only one container:
    let container = NSPersistentContainer(name: "BluSwiftUI")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Core Data failed to load: \(error)")
                
                return
            }
            
            // if we add a constraint, it only saves one of the duplicated values.
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}
