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
            SplashView { showSplash = false }
        } else {
            NavigationStack(path: $path) {
                
                // Wrap the conditional root view in a single Group so modifiers can chain
                Group {
                    if !OnboardingState.hasSeenAbout {
                        AboutView(path: $path)
                            .navigationBarBackButtonHidden(true)
                            .onAppear {
                                OnboardingState.hasSeenAbout = true
                            }
                    } else {
                        HomeView(path: $path)
                            .navigationBarBackButtonHidden(true)
                    }
                }
                // MARK: Navigation Destinations
                .navigationDestination(for: String.self) { value in
                    switch value {
                    case "aboutEye":
                        if !OnboardingState.hasSeenAboutEye {
                            AboutEyeView(path: $path)
                                .navigationBarBackButtonHidden(true)
                                .onAppear {
                                    OnboardingState.hasSeenAboutEye = true
                                }
                        } else {
                            // Skip AboutEye and go directly to exercise
                            EyeTrackingView(path: $path)
                                .navigationBarBackButtonHidden(true)
                        }
                        
                    case "aboutMemory":
                        if !OnboardingState.hasSeenAboutMemory {
                            AboutMemoryView(path: $path)
                                .navigationBarBackButtonHidden(true)
                                .onAppear {
                                    OnboardingState.hasSeenAboutMemory = true
                                }
                        } else {
                            MemoryView(path: $path)
                                .navigationBarBackButtonHidden(true)
                        }
                    
                    case "aboutManual":
                        AboutView(path: $path)
                            .navigationBarBackButtonHidden(true)
                    case "aboutEyeManual":
                        AboutEyeView(path: $path)
                            .navigationBarBackButtonHidden(true)
                        
                    case "aboutMemoryManual":
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
                // MemoryQuestion destination should be a sibling destination on the same view chain
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
