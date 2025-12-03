//
//  MemoryView.swift
//  Nira
//
//  Created by Yousra Abdelrahman on 11/06/1447 AH.
//
import SwiftUI
struct MemoryView: View {
    @Binding var path: NavigationPath
    var body: some View {
        ZStack{
            Text("Memory")
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                ToolbarButtonStyle(systemName: "arrow.left") {
                    path.append("home")
                }
            }
        }

    }
    
    
}
