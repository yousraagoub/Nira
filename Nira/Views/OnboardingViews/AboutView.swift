import SwiftUI

struct AboutView: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding: Bool = false
    @Binding var path: NavigationPath

    var body: some View {
        ZStack {
            Color.darkTeal.ignoresSafeArea()

            VStack(spacing: 30) {

                // X BUTTON
                HStack {
                    Button(action: {
                        hasSeenOnboarding = true
                        path = NavigationPath()   // 👈 يرجع للهوم مباشرة
                    }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(Color.brightGray)
                            .frame(width: 55, height: 55)
                            .background(Circle().fill(Color.clear))
                            .glassEffect(.clear.interactive())
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
Nira enhances visual perception and strengthens memory through visual exercises.
""")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)

                Spacer()

                Text("""
The shorter your exercise, the stronger your visual processing abilities.
""")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)

                Spacer()

                // NEXT BUTTON
                HStack {
                    Spacer()
                    Button(action: {
                        path.append("about2")   // 👈 الانتقال للصفحة الثانية
                    }) {
                        Image(systemName: "arrow.right")
                            .font(.system(size: 26, weight: .bold))
                            .foregroundColor(Color.brightGray)
                            .frame(width: 65, height: 65)
                            .background(Circle().fill(Color.clear))
                            .glassEffect(.clear.interactive())
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
