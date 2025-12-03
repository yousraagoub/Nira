import SwiftUI
import SwiftData

struct SplashView: View {
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false
    @State private var path = NavigationPath()
    @State private var fadeIn = false
    
    var body: some View {
        NavigationStack(path: $path) {

            ZStack {
                Color.darkTeal.ignoresSafeArea()

                VStack(spacing: 30) {

                    Image("NiraSplashLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 307, height: 432)
                        .opacity(fadeIn ? 1 : 0)
                        .animation(.easeOut(duration: 1.5), value: fadeIn)
                }
                .onAppear {
                    fadeIn = true
                    /// AUTO-NAVIGATE AFTER SPLASH
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                        if hasSeenOnboarding {
                            path.append("about")
                        } else {
                            path.append("home")
                        }
                    }
                }
            }
            // MARK: Navigation destinations
            .navigationDestination(for: String.self) { value in
                if value == "about" {
                    AboutView(path: $path)
                        .navigationBarBackButtonHidden(true)
                }
                if value == "about2" {
                    AboutView2(path: $path)
                        .navigationBarBackButtonHidden(true)
                }
                if value == "home" {
                    HomeView(path: $path)
                        .navigationBarBackButtonHidden(true)
                }
                if value == "insight" {
                    InsightsView(path: $path)
                        .navigationBarBackButtonHidden(true)
                }
                if value == "eyeTracking" {
                    EyeTrackingView(path: $path)
                        .navigationBarBackButtonHidden(true)
                }
                if value == "memory" {
                    MemoryView(path: $path)
                        .navigationBarBackButtonHidden(true)
                }
            }

        }
    }
}

#Preview {
    SplashView()
}
