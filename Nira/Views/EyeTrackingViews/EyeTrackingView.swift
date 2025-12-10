//
//  EyeTrackingView.swift
//  Nira
//
//  Created by Yousra Abdelrahman on 11/06/1447 AH.
//
import SwiftUI

struct EyeTrackingView: View {
    @Binding var path: NavigationPath
    @StateObject private var feedbackViewModel = FeedbackViewModel()
    @State private var exerciseStartTime = CACurrentMediaTime()

    
    @State var eyeGazeActive: Bool = true
    @State var lookAtPoint: CGPoint?
    @State var isWinking: Bool = false
    
    @State var ballYPosition: CGFloat = 20
    @State var ballSpeed: CGFloat = 10.0 // it was 2.0
    @State var stabilityTimer: TimeInterval = 0
    
    @State private var lastLookAtPoint: CGPoint?
    @State private var lastUpdateTime: TimeInterval = CACurrentMediaTime()
    
    let screenWidth = UIScreen.main.bounds.width

    var body: some View {
        ZStack {
            Color(.brightGray)
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
                        .fill(Color(.brightGray))

                    VStack {

                        Spacer()

                        ZStack {
                            Path { path in
                                let centerX = screenWidth / 2 - 20
                                path.move(to: CGPoint(x: centerX, y: 0))
                                path.addLine(to: CGPoint(x: centerX, y: 400))
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
                        .frame(height: 400)
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
                Text("Visual Perception")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.veryDarkTeal)
            }
            ToolbarItem(placement: .topBarLeading) {
                ToolbarButtonStyle(systemName: "xmark") {
                    path = NavigationPath()
                }
            }
         
            ToolbarItem(placement: .topBarTrailing) {
                ToolbarButtonStyle(systemName: "info") {
                    path.append("aboutEye")
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
        //-----------------------------
        .onAppear {
            exerciseStartTime = CACurrentMediaTime()
        }
        .sheet(isPresented: $feedbackViewModel.showFeedback) {
            FeedbackExactView(
                isCorrect: true,
                duration: feedbackViewModel.duration,
                path: $path)
            .presentationDetents([.medium])
            .interactiveDismissDisabled(true)
        }}
        


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
        if ballYPosition > 400 {
            ballYPosition = 400
            
            // 🟢 EXERCISE COMPLETED SUCCESSFULLY
            let endTime = CACurrentMediaTime()
            feedbackViewModel.duration = endTime - exerciseStartTime
            feedbackViewModel.feedbackIsCorrect = true
            feedbackViewModel.showFeedback = true
        }
    }

}

#Preview {
    NavigationStack {
        EyeTrackingView(path: .constant(NavigationPath()))
    }
}
