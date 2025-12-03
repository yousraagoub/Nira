//
// NavigationView.swift
//  Nira
//
//  Created by Yousra Abdelrahman on 12/06/1447 AH.
//
import SwiftUI
struct NavigationView: View {
    @EnvironmentObject var navigationVM: NavigationViewModel
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false

    var body: some View {
        NavigationStack(path: $navigationVM.path) {
            SplashView()
            .navigationDestination(for: NavigationRoute.self) { route in
                switch route {
                case .splash: SplashView()
                case .about: AboutView()
                case .home: HomeView()
                case .insights: AboutView()
                case .memory: AboutView()
                case .feedback: AboutView()
                case .question: AboutView()
                case .eyeTracking: AboutView()
                }
            }
        }
    }
}
