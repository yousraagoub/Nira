//
//  HomeView.swift
//  Nira
//
//  Created by Yousra Abdelrahman on 11/06/1447 AH.
//
import SwiftUI
struct HomeView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Color.brightGray.ignoresSafeArea(.all)
                VStack{
                    HomeButtonStyle(systemName: "eye") {
                    }
                    Text("Eye Tracking")
                        .foregroundColor(Color.darkTeal)
                        .font(Font.system(size: 32, weight: .bold))
                        .padding(.bottom, 100)
                    HomeButtonStyle(systemName: "brain.head.profile") {
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
                    }
                }
                ToolbarItemGroup(placement: .topBarTrailing) {
                    ToolbarButtonStyle(systemName: "chart.line.uptrend.xyaxis") {
                    }
                }
            }//.toolbar
        }//NavigationStack
    }//body
}//struct

#Preview {
    HomeView()
}
