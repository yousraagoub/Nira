//
//  EyeTrackingView.swift
//  Nira
//
//  Created by Yousra Abdelrahman on 11/06/1447 AH.
//
//
//import SwiftUI
//
//struct EyeTrackingView: View {
//    @Binding var path: NavigationPath
//    var body: some View {
//        ZStack{
//            Text("Eye Tracking")
//        }
//        .toolbar {
//            // INFO → ABOUT VIEW
//            ToolbarItem(placement: .topBarLeading) {
//                ToolbarButtonStyle(systemName: "arrow.left") {
//                    path.append("home")
//                }
//            }
//        }
//
//    }
//}
//import SwiftUI
//
//struct EyeTrackingView: View {
//    @Binding var path: NavigationPath
//    
//    @State var eyeGazeActive: Bool = true
//    @State var lookAtPoint: CGPoint?
//    @State var isWinking: Bool = false
//    
//    @State var ballYPosition: CGFloat = 20
//    @State var ballSpeed: CGFloat = 2.0
//    @State var stabilityTimer: TimeInterval = 0
//    
//    @State private var lastLookAtPoint: CGPoint?
//    @State private var lastUpdateTime: TimeInterval = CACurrentMediaTime()
//    
//    let screenWidth = UIScreen.main.bounds.width
//
//    var body: some View {
//        ZStack {
//            Color(red: 232/255, green: 236/255, blue: 240/255)
//                .ignoresSafeArea()
//
//            CustomARViewContainer(
//                eyeGazeActive: $eyeGazeActive,
//                lookAtPoint: $lookAtPoint,
//                isWinking: $isWinking
//            )
//            .allowsHitTesting(false)
//            .opacity(0.001)
//
//            VStack(alignment: .leading, spacing: 20) {
//                ZStack {
//                    RoundedRectangle(cornerRadius: 50)
//                        .fill(Color(red: 232/255, green: 236/255, blue: 240/255))
//
//                    VStack {
//                        HStack {
//                            circleButton(icon: "xmark") {
//                                path.append("home") // Navigate back
//                            }
//                            Spacer()
//                            circleButton(icon: "arrow.right") {
//                                // Add forward action if needed
//                            }
//                        }
//                        .padding(.horizontal, 10)
//                        .padding(.top, 10)
//
//                        Text("Track With Your\nEyes")
//                            .font(.system(size: 24, weight: .semibold))
//                            .multilineTextAlignment(.center)
//                            .padding(.top, -25)
//
//                        Spacer()
//
//                        ZStack {
//                            Path { path in
//                                let centerX = screenWidth / 2 - 20
//                                path.move(to: CGPoint(x: centerX, y: 0))
//                                path.addLine(to: CGPoint(x: centerX, y: 200))
//                            }
//                            .stroke(Color.gray, lineWidth: 8)
//
//                            Circle()
//                                .fill(Color.blue)
//                                .frame(width: 60, height: 60)
//                                .position(
//                                    x: screenWidth / 2 - 20,
//                                    y: ballYPosition
//                                )
//                        }
//                        .frame(height: 200)
//                        .padding(.bottom, 30)
//
//                        Spacer()
//                    }
//                }
//                .padding(.horizontal, 20)
//
//                Spacer()
//            }
//        }
//        .onChange(of: lookAtPoint) { newValue in
//            guard let newPoint = newValue else { return }
//            let now = CACurrentMediaTime()
//            let delta = now - lastUpdateTime
//            lastUpdateTime = now
//            updateStability(using: newPoint, delta: delta)
//            lastLookAtPoint = newPoint
//        }
//    }
//
//    // MARK: - Helper Functions
//    func circleButton(icon: String, action: @escaping () -> Void) -> some View {
//        Button(action: action) {
//            Image(systemName: icon)
//                .font(.system(size: 22, weight: .bold))
//                .foregroundColor(.black)
//                .frame(width: 55, height: 55)
//                .background(
//                    Circle()
//                        .fill(Color.white.opacity(0.95))
//                )
//                .shadow(color: .black.opacity(0.08), radius: 4, x: 0, y: 2)
//        }
//    }
//
//    func updateStability(using newPoint: CGPoint, delta: TimeInterval) {
//        if isGazeStable(newPoint: newPoint, previousPoint: lastLookAtPoint ?? newPoint) {
//            stabilityTimer += delta
//            if stabilityTimer >= 0.3 {
//                moveBall()
//                stabilityTimer = 0
//            }
//        } else {
//            stabilityTimer = 0
//        }
//    }
//
//    func isGazeStable(newPoint: CGPoint, previousPoint: CGPoint) -> Bool {
//        let dx = abs(newPoint.x - previousPoint.x)
//        let dy = abs(newPoint.y - previousPoint.y)
//        return dx < 10 && dy < 10
//    }
//
//    func moveBall() {
//        ballYPosition += ballSpeed
//        if ballYPosition > 200 { ballYPosition = 200 }
//    }
//}

import SwiftUI

struct EyeTrackingView: View {
    @Binding var path: NavigationPath
    
    @State var eyeGazeActive: Bool = true
    @State var lookAtPoint: CGPoint?
    @State var isWinking: Bool = false
    
    @State var ballYPosition: CGFloat = 20
    @State var ballSpeed: CGFloat = 2.0
    @State var stabilityTimer: TimeInterval = 0
    
    @State private var lastLookAtPoint: CGPoint?
    @State private var lastUpdateTime: TimeInterval = CACurrentMediaTime()
    
    let screenWidth = UIScreen.main.bounds.width

    var body: some View {
        ZStack {
            Color(red: 232/255, green: 236/255, blue: 240/255)
                .ignoresSafeArea()

            CustomARViewContainer(
                eyeGazeActive: $eyeGazeActive,
                lookAtPoint: $lookAtPoint,
                isWinking: $isWinking
            )
            .allowsHitTesting(false)
            .opacity(0.001)

            VStack(alignment: .leading, spacing: 20) {
                ZStack {
                    RoundedRectangle(cornerRadius: 50)
                        .fill(Color(red: 232/255, green: 236/255, blue: 240/255))

                    VStack {
//                        HStack {
//                            circleButton(icon: "xmark") {
//                                path.append("home") // Navigate back
//                            }
//                            Spacer()
//                            circleButton(icon: "arrow.right") {
//                                // Forward action
//                            }
//                        }
//                        .padding(.horizontal, 10)
//                        .padding(.top, 10)

//                        Text("Focus on the ball")
//                            .font(.system(size: 24, weight: .semibold))
//                            .multilineTextAlignment(.center)
//                            .padding(.top, -25)
//                            .foregroundColor(Color.veryDarkTeal)

                        Spacer()

                        ZStack {
                            Path { path in
                                let centerX = screenWidth / 2 - 20
                                path.move(to: CGPoint(x: centerX, y: 0))
                                path.addLine(to: CGPoint(x: centerX, y: 200))
                            }
                            .stroke(Color.gray, lineWidth: 8)

                            Circle()
                                .fill(Color.darkTeal)
                                .frame(width: 60, height: 60)
                                .position(
                                    x: screenWidth / 2 - 20,
                                    y: ballYPosition
                                )
                        }
                        .frame(height: 200)
                        .padding(.bottom, 30)

                        Spacer()
                    }
                }
                .padding(.horizontal, 20)

                Spacer()
            }
        }
        .toolbar{
           
            ToolbarItem(placement: .principal) {
                Text("Focus on the ball")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.veryDarkTeal)
            }
            ToolbarItem(placement: .topBarLeading) {
                ToolbarButtonStyle(systemName: "xmark") {
                    path = NavigationPath()
                }
            }
        }
        .onChange(of: lookAtPoint) { newValue in
            guard let newPoint = newValue else { return }
            let now = CACurrentMediaTime()
            let delta = now - lastUpdateTime
            lastUpdateTime = now
            updateStability(using: newPoint, delta: delta)
            lastLookAtPoint = newPoint
        }
    }

    func circleButton(icon: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Image(systemName: icon)
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(.black)
                .frame(width: 55, height: 55)
                .background(
                    Circle()
                        .fill(Color.white.opacity(0.95))
                )
                .shadow(color: .black.opacity(0.08), radius: 4, x: 0, y: 2)
        }
    }

    func updateStability(using newPoint: CGPoint, delta: TimeInterval) {
        if isGazeStable(newPoint: newPoint, previousPoint: lastLookAtPoint ?? newPoint) {
            stabilityTimer += delta
            if stabilityTimer >= 0.3 {
                moveBall()
                stabilityTimer = 0
            }
        } else {
            stabilityTimer = 0
        }
    }

    func isGazeStable(newPoint: CGPoint, previousPoint: CGPoint) -> Bool {
        let dx = abs(newPoint.x - previousPoint.x)
        let dy = abs(newPoint.y - previousPoint.y)
        return dx < 10 && dy < 10
    }

    func moveBall() {
        ballYPosition += ballSpeed
        if ballYPosition > 200 { ballYPosition = 200 }
    }
}

#Preview {
    NavigationStack {
        EyeTrackingView(path: .constant(NavigationPath()))
    }
}
