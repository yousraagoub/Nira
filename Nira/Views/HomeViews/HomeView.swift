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
            Color.brightGray.ignoresSafeArea()

            VStack {
                HomeButtonStyle(systemName: "eye") {
                    path.append("aboutEye")
                    
                }

                Text("Visual Perception")
                    .foregroundColor(Color.darkTeal)
                    .font(.system(size: 32, weight: .bold))
                    .padding(.bottom, 100)

                HomeButtonStyle(systemName: "brain.head.profile") {
                    path.append("aboutMemory")
                }
                Text("Memory")
                    .foregroundColor(Color.darkTeal)
                    .font(.system(size: 32, weight: .bold))
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                ToolbarButtonStyle(systemName: "info") {
                    path.append("about")
                }
            }
            ToolbarItem(placement: .topBarLeading) {
                ToolbarButtonStyle(systemName: "flame.fill") {
                    path.append("streak")
                }
            }
        }
    }
}

#Preview {
    HomeView(path: .constant(NavigationPath()))
}
