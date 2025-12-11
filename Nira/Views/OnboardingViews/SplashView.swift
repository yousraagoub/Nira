import SwiftUI
import SwiftData

import SwiftUI

struct SplashView: View {
    @State private var fadeIn = false

    var onFinish: () -> Void

    var body: some View {
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
        }
        .onAppear {
            fadeIn = true

            // الانتقال بعد الانيميشن
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                onFinish()   // ← يرجّعك إلى RootView ويشغّل NavigationStack
            }
        }
    }
}
//#Preview {
//    SplashView()
//}
