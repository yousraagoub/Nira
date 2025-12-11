import SwiftUI

struct AboutView: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding: Bool = false
    @Binding var path: NavigationPath
    
    var body: some View {
        ZStack {
            Color.darkTeal.ignoresSafeArea()
            VStack{
                
                Text("Welcome to Nira\n\n")
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
Where you will enhances visual perception and strengthens memory through visual exercises.\n\n
The more consistent you are with exercises, the stronger your visual processing abilities.
""")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
                
                Spacer()
                
                Spacer()
            }
        }
        .toolbar{
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    // Goes back to home screen
                    path = NavigationPath()
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(Color.darkTeal)
                }
                
            }

        }
    }
}
#Preview {
    AboutView(path: .constant(NavigationPath()))
}
