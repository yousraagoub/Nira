//
//  EyeTrackingInstructions.swift
//  Nira
//
//  Created by Yousra Abdelrahman on 18/06/1447 AH.
//
import SwiftUI

struct EyeTrackingInstructions: View {
    @Binding var path: NavigationPath
    var body: some View {
        ZStack{
            Color.brightGray.ignoresSafeArea(.all)
            VStack{
                Text("\n  Eye Tracking Instructions  \n")
                    .font(Font.system(size: 24, weight: .bold))
                    .foregroundColor(Color.brightGray)
                    .background(Color.darkTeal)
                    .frame(width: 550, height: 100)
                    .cornerRadius(100)
//                Text("This exercise uses eye-tracking to measure your focus.\n\n")
                Group{
                    Text("\n\n1. Look at the circle in the center.\n\n")
                    Text("2. Once detected, the circle\nwill move downward.\n\n")
                    Text("3. If it pauses, simply refocus your gaze.\n\n")
                }
                .foregroundColor(Color.veryDarkTeal)
                .font(Font.system(size: 20, weight: .bold))
                Text("For best results, keep your eyes and face clearly visible.\n")
                
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                ToolbarButtonStyle(systemName: "xmark") {
                    if !path.isEmpty {
                        path.removeLast()
                    }
                }
            }
            ToolbarItem(placement: .bottomBar) {
                ToolbarButtonStyle(systemName: "arrow.forward") {
                    path.append("eyeTracking")
                }
            }
        }
    }
}

#Preview {
    EyeTrackingInstructions(path: .constant(NavigationPath()))
}
