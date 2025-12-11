//
//  RootView.swift
//  Nira
//
//  Created by Raghad Alzemami on 15/06/1447 AH.
//

import SwiftUI

struct RootView: View {
    @State private var showSplash = true
    @State private var path = NavigationPath()

    var body: some View {
        if showSplash {
            SplashView {
                // بعد انتهاء السبلتش، ادخلي على النافيقيشن
                showSplash = false
            }
        } else {
            NavigationStack(path: $path) {
                
                // 👑 HomeView = أول شاشة دائماً
                HomeView(path: $path)
                    .navigationBarBackButtonHidden(true)

                    // MARK: Navigation Destinations
                    .navigationDestination(for: String.self) { value in
                        switch value {

                        case "about":
                            AboutView(path: $path)
                                .navigationBarBackButtonHidden(true)

                        case "aboutEye":
                            AboutEyeView(path: $path)
                                .navigationBarBackButtonHidden(true)
                        case "aboutMemory":
                            AboutMemoryView(path: $path)
                                .navigationBarBackButtonHidden(true)


                        case "eyeTracking":
                            EyeTrackingView(path: $path)
                                .navigationBarBackButtonHidden(true)

                        case "memory":
                            MemoryView(path: $path)
                                .navigationBarBackButtonHidden(true)
                        case "streak":
                            streakView(path: $path)
                                .navigationBarBackButtonHidden(true)


                        default:
                            EmptyView()
                        }
                    }

                    // For Memory questions
                    .navigationDestination(for: MemoryQuestion.self) { question in
                        QuestionView(
                            viewModel: QuestionViewModel(question: question),
                            path: $path
                        )
                        .navigationBarBackButtonHidden(true)
                    }
            }
        }
    }
}
