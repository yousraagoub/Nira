//
//  HomeButtonStyle.swift
//  Nira
//
//  Created by Yousra Abdelrahman on 11/06/1447 AH.
//
import SwiftUI
struct HomeButtonStyle: View {
    let systemName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: systemName)
                .foregroundColor(Color.brightGray)
                .font(Font.system(size: 70, weight: .bold))
        }
        .buttonStyle(.plain)
        .frame(width: 160, height: 160)
        .background(Color.darkTeal)
        .glassEffect(.clear.interactive())
        .clipShape(Circle())
        
    }
}

