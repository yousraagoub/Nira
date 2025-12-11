//
//  FeebackView.swift
//  Nira
//
//  Created by Yousra Abdelrahman on 11/06/1447 AH.
//

import SwiftUI
struct FeedbackCircleView: View {
    let isCorrect: Bool
    private var imageName: String {
        isCorrect ? "greenyheart" : "pinkyheart"
    }
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 140, height: 140)
    }
}

struct FeedbackExactView: View {
    let isCorrect: Bool
    let duration: TimeInterval
    @Binding var path: NavigationPath
    @Environment(\.dismiss) private var dismiss
    
    private var titleText: String {
        if isCorrect {
            return formattedDuration}
        else {
            return "Try Again!"
        }
    }
    
    private var formattedDuration: String {
//        let totalSeconds = Int(duration.rounded())
//        let minutes = totalSeconds / 60
//        let seconds = totalSeconds % 60
//        
//        
//        if minutes == 0 {
//            return "\(seconds) seconds"
//        } else {
//            return "\(minutes) minutes \(seconds) seconds"
//        }
//        
        return "Good job"
    }
    
    var body: some View {
        ZStack {
            Color.brightGray
                .ignoresSafeArea()
            VStack{
                Spacer(minLength: 20)
                
                VStack(spacing: 16) {
                    
                    FeedbackCircleView(isCorrect: isCorrect)
                    Text(titleText)
                        .font(.custom("Helvetica-Bold", size: 22))
                        .foregroundColor(.veryDarkTeal)
                        .multilineTextAlignment(.center)
                    
                }
                .padding(.horizontal, 24)
                
                Spacer(minLength: 80) }}
        .safeAreaInset(edge: .bottom) {
            HStack {
                Button {
                    path = NavigationPath()
                    dismiss()
                } label: {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 52, height: 52)
                        .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 5)
                        .overlay(
                            Image(systemName: "house")
                                .font(.system(size: 22))
                                .foregroundColor(.black))}
                Spacer()
                Button {
                    dismiss()
                    path.removeLast()
                } label: {
                    Circle()
                        .fill(.darkTeal)
                        .frame(width: 52, height: 52)
                        .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 5)
                        .overlay(
                            Image(systemName: "repeat")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(.white))
                }}
            .padding(.horizontal, 20)
            .padding(.top, 12)
            .padding(.bottom, 12)
            
            
        }
    }}


