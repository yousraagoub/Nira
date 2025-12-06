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

    private var circleColor: Color {
        if isCorrect {
            // 0E9310
            return Color(
                red: 14/255,
                green: 147/255,
                blue: 16/255
            )
        } else {
            // D65902
            return Color(
                red: 214/255,
                green: 89/255,
                blue: 2/255
            )
        }
    }

    private var iconName: String {
        isCorrect ? "hands.clap.fill" : "repeat"
    }

    var body: some View {
        ZStack {
            Circle()
                .fill(circleColor)
                .frame(width: 300, height: 300)
                .shadow(
                    color: Color.black.opacity(0.18),
                    radius: 25,
                    x: 0,
                    y: 15
                )

            Image(systemName: iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 110, height: 110)
                .foregroundColor(.white)
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
            return "Try Again"
        }
    }

    private var formattedDuration: String {
        let totalSeconds = Int(duration.rounded())
        let minutes = totalSeconds / 60
        let seconds = totalSeconds % 60

        if minutes == 0 {
            return "\(seconds) sec"
        } else {
            return "\(minutes) min \(seconds) sec"
        }
    }

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()

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
