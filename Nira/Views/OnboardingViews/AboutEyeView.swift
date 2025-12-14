import SwiftUI

struct AboutEyeView: View {
    @Binding var path: NavigationPath

    var body: some View {
        ZStack {
            Color.darkTeal.ignoresSafeArea()

            VStack{
                Spacer()
                Image("EyeAbout")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 255, height: 255)
                Spacer()
                Text("""
Focus your gaze on the circle until it moves downwards.
""")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                Spacer()
                HStack{
                    Image(systemName: "lightbulb.max.fill")
                        .font(.system(size: 24))
                        .foregroundColor(Color.brightGray)
                        .padding(.leading, 30)

                    
                    Text("\nFor best performance, make sure your eyes and face are not covered.")
                        .font(.system(size: 20))
                        .foregroundColor(Color.brightGray)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 30)
                }
                Spacer()
                

            }
//            .padding()
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Visual Perception")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.brightGray)
            }
            //            ToolbarItem(placement: .topBarLeading) {
            //                Button(action: {
            //                    // Goes back to home screen
            //                    path = NavigationPath()
            //                }) {
            //                    Image(systemName: "xmark")
            //                        .foregroundColor(Color.darkTeal)
            //                }
            //
            //            }
            if (OnboardingState.hasSeenAboutEye == false) {
                ToolbarItemGroup(placement: .bottomBar) {
                Spacer()
                Button(action: {
                    // Goes to eye tracking exercise
                    path.append("eyeTracking")
                }){
                    Image(systemName: "arrow.forward")
                        .foregroundColor(.darkTeal)
                }
            }
        } else {
            ToolbarItemGroup(placement: .topBarLeading) {
               
                Button(action: {
                    // Goes to memory exercise
                    path.removeLast()
                }){
                    Image(systemName: "arrow.backward")
                        .foregroundColor(.darkTeal)
                }
            }
        }
        }
    }
}
#Preview {
    AboutEyeView(path: .constant(NavigationPath()))
}

