//
//  HomeView.swift
//  Nira
//
//  Created by Yousra Abdelrahman on 11/06/1447 AH.
//
import SwiftUI

struct HomeView: View {
    @Binding var path: NavigationPath

    var body: some View {
        ZStack {
            Color.brightGray.ignoresSafeArea(.all)

            VStack {
                // MAIN EYE TRACKING BUTTON
                HomeButtonStyle(systemName: "eye") {
                    path.append("eyeTracking")
                }

                Text("Eye Tracking")
                    .foregroundColor(Color.darkTeal)
                    .font(Font.system(size: 32, weight: .bold))
                    .padding(.bottom, 100)

                // MAIN MEMORY BUTTON
                HomeButtonStyle(systemName: "brain.head.profile") {
                    path.append("memory")
                }

                Text("Memory")
                    .foregroundColor(Color.darkTeal)
                    .font(Font.system(size: 32, weight: .bold))
            }
        }

        // MARK: - TOOLBAR BUTTONS
        .toolbar {
            // INFO → ABOUT VIEW
            ToolbarItem(placement: .topBarLeading) {
                ToolbarButtonStyle(systemName: "info") {
                    path.append("about")
                }
            }

            // INSIGHT → INSIGHT VIEW
            ToolbarItem(placement: .topBarTrailing) {
                ToolbarButtonStyle(systemName: "chart.line.uptrend.xyaxis") {
                    path.append("insight")
                }
            }
        }
    }
}

#Preview {
    HomeView(path: .constant(NavigationPath()))
}
