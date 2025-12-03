import SwiftUI
import SwiftData

struct SplashView: View {
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
                    }
            }
        }
    }
  
    }

#Preview {
    SplashView()
}
