import SwiftUI

struct AboutMemoryView: View {
    @Binding var path: NavigationPath

    var body: some View {
        ZStack {
            Color.darkTeal.ignoresSafeArea()

            VStack{
                Spacer()
                Image("MemoryAbout")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 355, height: 150)
                Spacer()
                Text("""
Look at the picture and memorize it, then move to then next page to answer questions.

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

                    
                    Text("\nTry to observe as many details as possible.")
                        .font(.system(size: 20))
                        .foregroundColor(Color.brightGray)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 30)
                }
                Spacer()
                

            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Memory")
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
            if (OnboardingState.hasSeenAboutMemory == false) {
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    Button(action: {
                        // Goes to memory exercise
                        path.append("memory")
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
    AboutMemoryView(path: .constant(NavigationPath()))
}

