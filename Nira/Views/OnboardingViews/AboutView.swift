import SwiftUI

struct AboutView: View {
    @EnvironmentObject var navigationVM: NavigationViewModel
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false
    
    var body: some View {
        ZStack {
            // Background Color
            Color.darkTeal.ignoresSafeArea()
            VStack(spacing: 30) {
                
                // زر الاكس فيه نافقيشن
                HStack {
                    Button(action: {
                        hasSeenOnboarding = true
                        navigationVM.setRoot(to: .home)
                    }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(Color(red: 230/255, green: 246/255, blue: 246/255))
                            .frame(width: 55, height: 55)
                            .background(
                                Circle()
                                    .fill(Color.white.opacity(0.2))
                            )
                    }
                    .padding(.leading, 7)
                    
                    Spacer()
                }
                .padding(.top, -20)
                
                Spacer()
                
                Text("Welcome to NIRA.")
                    .font(.system(size: 28, weight: .semibold))
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                
                Image("NiraLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160, height: 160)
                    .padding(.top, -10)
                
                Text("""
NIRA enhances visual perception and strengthens memory through short exercises.
""")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                
                Text("""
The faster you train, the stronger your memory becomes.

""")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                
                Spacer()
                
                // زر السهم فيه نافقيشن
                HStack {
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "arrow.left")
                            .font(.system(size: 26, weight: .bold))
                            .foregroundColor(Color(red: 230/255, green: 246/255, blue: 246/255))
                            .frame(width: 65, height: 65)
                            .background(
                                Circle()
                                    .fill(Color.white.opacity(0.2))
                            )
                    }
                    .padding(.bottom, 10)
                    .padding(.trailing, 260)
                    Spacer()
                }
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    AboutView()
        .environmentObject(NavigationViewModel())
}

