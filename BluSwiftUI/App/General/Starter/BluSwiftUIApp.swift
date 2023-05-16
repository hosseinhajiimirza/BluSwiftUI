//
//  BluSwiftUIApp.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/15/23.
//

import SwiftUI

@main
struct BluSwiftUIApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject private var coreDataViewModel: CoreDataViewModel = .init()
    
    var body: some Scene {
        WindowGroup {
            Root()
                .environment(\.managedObjectContext, coreDataViewModel.container.viewContext)
        }
    }
}
