//
//  InsightsView.swift
//  Nira
//
//  Created by Yousra Abdelrahman on 11/06/1447 AH.
//

import SwiftUI
struct InsightsView: View {
    @Binding var path: NavigationPath
    var body: some View {
        ZStack{
            Text("Insight")
        }
        .toolbar {
            // INFO → ABOUT VIEW
            ToolbarItem(placement: .topBarLeading) {
                ToolbarButtonStyle(systemName: "arrow.left") {
                    path.append("home")
                }
            }
        }

    }
}
