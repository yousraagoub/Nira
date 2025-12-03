import SwiftUI
import SwiftData

struct SplashView: View {
    @State private var fadeIn = false
    
    var body: some View {
        ZStack {
            // Background Color
            Color(red: 48/255, green: 95/255, blue: 102/255).ignoresSafeArea()
            
            VStack(spacing: 30) {
                
                // Logo
                Image("NiraLogo")
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
