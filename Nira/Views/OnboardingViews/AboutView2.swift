import SwiftUI

struct AboutView2: View {
    @Binding var path: NavigationPath

    var body: some View {
        ZStack {
            Color.darkTeal.ignoresSafeArea()

            VStack(spacing: 30) {

                // X BUTTON
                HStack {
                    Button(action: {
                        path = NavigationPath()    // 👈 يرجع للهوم مباشرة
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

                Image(systemName: "eye")
                    .font(.system(size: 84, weight: .bold))
                    .foregroundColor(Color.brightGray)

                Text("This exercise will enhance your visual perception abilities.")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)

                Spacer()

                Image(systemName: "brain.head.profile")
                    .font(.system(size: 84, weight: .bold))
                    .foregroundColor(Color.brightGray)

                Text("This exercise will enhance the strength of your visual memory.")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)

                Spacer()

                // BACK TO ABOUT1
                HStack {
                    Spacer()
                    Button(action: {
                        path.append("about")   // 👈 يرجع للصفحة الأولى
                    }) {
                        Image(systemName: "hand.tap.fill")
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
    AboutView2(path: .constant(NavigationPath()))
}

