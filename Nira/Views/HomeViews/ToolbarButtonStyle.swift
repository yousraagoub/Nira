//
//  ToolbarButtonStyle.swift
//  Nira
//
//  Created by Yousra Abdelrahman on 11/06/1447 AH.
//
import SwiftUI
struct ToolbarButtonStyle: View {
    let systemName: String
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Image(systemName: systemName)
                .foregroundColor(Color.veryDarkTeal)
        }
        .buttonStyle(.plain)
        .background(Color.whiteWhite)
    }
}

struct ToolbarBottomButtonStyle: View {
    let systemName: String
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Image(systemName: systemName)
                .foregroundColor(Color.brightGray)
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .buttonStyle(.plain)

    }
}
