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
    
    init() {
        // To hide the back button text and set a color for it.
        let backButtonAppearance = UIBarButtonItemAppearance()
        backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
        let appearance = UINavigationBarAppearance()
        appearance.backButtonAppearance = backButtonAppearance
        let image = UIImage(systemName: "chevron.backward")?.withTintColor(UIColor.label, renderingMode: .alwaysOriginal)
        appearance.setBackIndicatorImage(image, transitionMaskImage: image)
        
        UINavigationBar.appearance().standardAppearance = appearance
    }
    
    var body: some Scene {
        WindowGroup {
            Root()
                .environment(\.managedObjectContext, coreDataViewModel.container.viewContext)
        }
    }
}
