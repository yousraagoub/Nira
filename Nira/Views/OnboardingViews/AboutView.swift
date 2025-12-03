import SwiftUI

struct AboutView: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding: Bool = false
    @Binding var path: NavigationPath
    var body: some View {
        ZStack {
            Color.darkTeal.ignoresSafeArea()
            VStack(spacing: 30) {
                HStack {
                    Button(action: {
                        hasSeenOnboarding = true
                        path.append("home")
                    }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(Color.brightGray)
                            .frame(width: 55, height: 55)
                            .background(
                                Circle()
                                    .fill(Color.whiteWhite.opacity(0.2))
                            )
                    }
                    .padding(.leading, 7)

                    Spacer()
                }
                .padding(.top, -20)

                Spacer()

                Text("Welcome to Nira")
                    .font(.system(size: 28, weight: .semibold))
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)

                Image("NiraLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 139, height: 139)
                    .padding(.top, -10)
                
                Spacer()
                
                Text("""
Nira enhances visual perception and strengthens memory through short exercises.
""")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
                Spacer()
                Text("""
The faster you train, the stronger your memory becomes.
""")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)

                Spacer()

                HStack {
                    Spacer()
                    Button(action: {
                        path.append("about2")
                    }) {
                        Image(systemName: "hand.tap.fill")
                            .font(.system(size: 26, weight: .bold))
                            .foregroundColor(Color.brightGray)
                            .frame(width: 65, height: 65)
                            .background(
                                Circle()
                                    .fill(Color.whiteWhite.opacity(0.2))
                            )
                    }
                    Spacer()
                }
            }
            .padding()
        }
    }
}

#Preview {
    AboutView(path: .constant(NavigationPath()))
}
