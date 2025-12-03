//
//  HomeView.swift
//  Nira
//
//  Created by Yousra Abdelrahman on 11/06/1447 AH.
//
import SwiftUI
struct HomeView: View {
    //For Testing
    @StateObject var navigationVM = NavigationViewModel()
    var body: some View {
        NavigationStack(path: $navigationVM.path){
            ZStack{
                Color.brightGray.ignoresSafeArea(.all)
                VStack{
                    HomeButtonStyle(systemName: "eye") {
                        navigationVM.navigate(to: .eyeTracking)
                    }
                    Text("Eye Tracking")
                        .foregroundColor(Color.darkTeal)
                        .font(Font.system(size: 32, weight: .bold))
                        .padding(.bottom, 100)
                    HomeButtonStyle(systemName: "brain.head.profile") {
                        navigationVM.navigate(to: .memory)
                    }
                    Text("Memory")
                        .foregroundColor(Color.darkTeal)
                        .font(Font.system(size: 32, weight: .bold))
                }//VStack
            }//ZStack
            //Toolbar modifier for About screen and Insight Screen
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    ToolbarButtonStyle(systemName: "info") {
                        navigationVM.navigate(to: .about)
                    }
                }
                ToolbarItemGroup(placement: .topBarTrailing) {
                    ToolbarButtonStyle(systemName: "chart.line.uptrend.xyaxis") {
                        navigationVM.navigate(to: .insights)
                    }
                }
            }//.toolbar
        }//NavigationStack
        .navigationDestination(for: NavigationRoute.self) { route in
            switch route {
            case .splash: SplashView()
            case .about: SplashView()
            case .insights: SplashView()
            case .memory: SplashView()
            case .feedback: SplashView()
            case .question: SplashView()
            case .eyeTracking: SplashView()
            }
        }
    }//body
}//struct

#Preview {
    HomeView()
}
