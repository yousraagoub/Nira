//
//  NiraApp.swift
//  Nira
//
//  Created by Yousra Abdelrahman on 05/06/1447 AH.
//

import SwiftUI
import SwiftData

@main
struct NiraApp: App {
    @StateObject var navigationVM = NavigationViewModel()
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            SplashView().environmentObject(navigationVM)
        }
        .modelContainer(sharedModelContainer)
    }
}
