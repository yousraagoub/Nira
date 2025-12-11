//
//  streakView.swift
//  Nira
//
//  Created by Yousra Abdelrahman on 11/06/1447 AH.
//

import SwiftUI
import Charts


struct streakView: View {
    @Binding var path: NavigationPath
    var body: some View {
        ZStack{
            Color.brightGray.ignoresSafeArea(.all)
            VStack{
                Text("streakView")
                    .font(.title2)
                    .fontWeight(.semibold)
                
            }
            .padding()
        }
        .toolbar{
            ToolbarItem(placement: .topBarLeading) {
                ToolbarButtonStyle(systemName: "xmark") {
                    if !path.isEmpty {
                        path.removeLast()
                    }
                }
            }
        }

    }
}
