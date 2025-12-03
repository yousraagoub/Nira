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
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false
    
//    enum Screen: Hashable {
//        case splash
//        case about
//        case home
//    }
    
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            Item.self,
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()

    var body: some Scene {
        WindowGroup {
                // The root screen is splash
            SplashView()
//                    .navigationDestination(for: String.self) { screen in
//                        switch screen {
//                        case "splash":
//                            SplashView()
//                        case "about":
//                            AboutView()
//                        case "home":
//                            HomeView()
//                        default:
//                            HomeView()
//                        }
//                    }
        }
//        .modelContainer(sharedModelContainer)
    }
}
