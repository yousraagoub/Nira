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
                            .foregroundColor(Color.brightGray)
                            .frame(width: 55, height: 55)
                            .background(
                                Circle()
                                    .fill(Color.clear)
                            )
                            .glassEffect(.clear.interactive())
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
                Text("This exercise will enhance your visual perception abilities.")
                       .font(.system(size: 20, weight: .medium))
                       .foregroundColor(.whiteWhite)
                       .multilineTextAlignment(.center)
                       .padding(.horizontal, 30)
                Spacer()
                Image(systemName: "brain.head.profile")
                    .font(Font.system(size: 84, weight: .bold))
                    .bold()
                    .foregroundColor(Color.brightGray)
               
               Text("This exercise will enhance the strength of your visual memory.")
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
                            .foregroundColor(Color.brightGray)
                            .frame(width: 65, height: 65)
                            .background(
                                Circle()
                                    .fill(Color.clear)
                            )
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

