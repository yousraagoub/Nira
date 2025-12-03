import SwiftUI
import SwiftData

struct SplashView: View {
    @EnvironmentObject var navigationVM: NavigationViewModel
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false

    @State private var fadeIn = false
    
    var body: some View {
        ZStack {
            // Background Color
            Color.darkTeal.ignoresSafeArea()
            VStack(spacing: 30) {
                // Logo
                Image("NiraSplashLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 307, height: 432)
                    .foregroundColor(Color.brightGray)
                    .animation(.easeOut(duration: 1.2), value: fadeIn)
                    .onAppear {
                        fadeIn = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                if hasSeenOnboarding == false {
                                    navigationVM.setRoot(to: .about)
                                } else {
                                    navigationVM.setRoot(to: .home)
                                }
                            }
    
                    }
            }
        }//ZStack
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SplashView()
        .environmentObject(NavigationViewModel())
}
