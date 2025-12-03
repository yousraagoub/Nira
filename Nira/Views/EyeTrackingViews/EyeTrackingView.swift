//
//  EyeTrackingView.swift
//  Nira
//
//  Created by Yousra Abdelrahman on 11/06/1447 AH.
//

import SwiftUI

struct EyeTrackingView: View {
    @Binding var path: NavigationPath
    var body: some View {
        ZStack{
            Text("Eye Tracking")
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
