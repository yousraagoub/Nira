import SwiftUI

struct AboutView2: View {
    @Binding var path: NavigationPath
    var body: some View {
        ZStack {
            //Background Color
            Color.darkTeal.ignoresSafeArea()
            VStack(spacing: 30) {
                //The X button
                HStack {
                    Button(action: {path.append("home")}) {
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
                
                Image(systemName: "eye")
                    .font(Font.system(size: 84, weight: .bold))
                    .bold()
                    .foregroundColor(Color.brightGray)
                Text("This training will enhance your visual perception abilities.")
                       .font(.system(size: 20, weight: .medium))
                       .foregroundColor(.whiteWhite)
                       .multilineTextAlignment(.center)
                       .padding(.horizontal, 30)
                Spacer()
                Image(systemName: "brain.head.profile")
                    .font(Font.system(size: 84, weight: .bold))
                    .bold()
                    .foregroundColor(Color.brightGray)
               
               Text("This training will enhance the strength of your visual memory.")
                   .font(.system(size: 20, weight: .medium))
                   .foregroundColor(.whiteWhite)
                   .multilineTextAlignment(.center)
                   .padding(.horizontal, 30)
                Spacer()
                
               //The arrow button
                HStack {
                    Spacer()
                    Button(action: {path.append("about")}) {
                        Image(systemName: "hand.tap.fill")
                            .font(.system(size: 26, weight: .bold))
                            .foregroundColor(Color(red: 230/255, green: 246/255, blue: 246/255))
                            .frame(width: 65, height: 65)
                            .background(
                                Circle()
                                    .fill(Color.white.opacity(0.2))
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
    AboutView2(path: .constant(NavigationPath()))
}

