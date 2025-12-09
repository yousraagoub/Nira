//
//  FeebackView.swift
//  Nira
//
//  Created by Yousra Abdelrahman on 11/06/1447 AH.
//

import SwiftUI

//struct FeedbackView: View { var body: some View { Text("Feedback") } }


struct FeedbackCircleView: View {
    let isCorrect: Bool

    private var iconName: String {
        isCorrect ? "checkmark" : "xmark"
    }
    private var heartColor: Color {
        isCorrect ? Color.greenyheart : Color.pinkyheart
    }

    var body: some View {
        ZStack {
            Image(systemName: "heart.fill")
                .font(Font.system(size: 300))
                .foregroundColor(heartColor)
            Image(systemName: iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 130, height: 130)
                .foregroundColor(Color.brightGray)
        }
    }
}

struct FeedbackExactView: View {
    let isCorrect: Bool
    let duration: TimeInterval
    @Binding var path: NavigationPath     // 🔥 NEW: to control navigation

    @Environment(\.dismiss) private var dismiss

    private var titleText: String {
        if isCorrect {
            return formattedDuration
        } else {
            return String(localized:"Try Again")
        }
    }

    private var formattedDuration: String {
        let totalSeconds = Int(duration.rounded())
        let minutes = totalSeconds / 60
        let seconds = totalSeconds % 60

        if minutes == 0 {
            return String(localized:"\(seconds) seconds")
        } else {
            return String(localized:"\(minutes) minutes \(seconds) seconds")
        }
    }

    var body: some View {
        ZStack {
            Color.brightGray.ignoresSafeArea()

            VStack(spacing: 0) {
                Spacer().frame(height: 80)

                Text(titleText)
                    .frame(width: 294, height: 29)
                    .font(.custom("Helvetica-Bold", size: 24))
                    .foregroundColor(Color(red: 14/255, green: 53/255, blue: 58/255))
                    .multilineTextAlignment(.center)

                Spacer()

                FeedbackCircleView(isCorrect: isCorrect)

                Spacer()

                HStack {
                    // 🏠 HOME BUTTON
                    Button {
                        path = NavigationPath()
                        dismiss()// ← يرجع للهوم مباشرة
                    } label: {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 52, height: 52)
                            .shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 5)
                            .overlay(
                                Image(systemName: "house")
                                    .font(.system(size: 22))
                                    .foregroundColor(.black)
                            )
                    }

                    Spacer()

                    // 🔄 REPEAT BUTTON
                    Button {
                        dismiss()
                        path.removeLast()
                    } label: {
                        Circle()
                            .fill(Color(red: 25/255, green: 98/255, blue: 106/255))
                            .frame(width: 52, height: 52)
                            .shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 5)
                            .overlay(
                                Image(systemName: "repeat")
                                    .font(.system(size: 22, weight: .bold))
                                    .foregroundColor(.white)
                            )
                    }
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 40)
            }
        }
    }
}
