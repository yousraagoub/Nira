import SwiftUI

struct AboutView2: View {
    var body: some View {
        ZStack {
            //Background Color
            Color.darkTeal.ignoresSafeArea()
            VStack(spacing: 30) {
                //The X button
                HStack {
                    Button(action: {}) {
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
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .bold()
                    .foregroundColor(Color.brightGray)
                           
                Text("This training will enhance your visual perception abilities.")
                              
                       .font(.system(size: 20, weight: .medium))
                           .foregroundColor(.white)
                           .multilineTextAlignment(.center)
                           .padding(.horizontal, 30)
                       
                Image(systemName: "brain.head.profile")
                   .resizable()
                   .scaledToFit()
                   .frame(width: 150, height: 150)
                   .bold()
                   .foregroundColor(Color.brightGray)
               
               Text("This training will enhance the strength of your visual memory.")
                   .font(.system(size: 20, weight: .medium))
                   .foregroundColor(.white)
                   .multilineTextAlignment(.center)
                   .padding(.horizontal, 30)
                           
                Spacer()
                
                // //The arrow button
                HStack {
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "arrow.right")
                            .font(.system(size: 26, weight: .bold))
                            .foregroundColor(Color(red: 230/255, green: 246/255, blue: 246/255))
                            .frame(width: 65, height: 65)
                            .background(
                                Circle()
                                    .fill(Color.white.opacity(0.2))
                            )
                    }
                    .padding(.bottom, 10)
                    .padding(.trailing, 30)
                    
                }
            }
            .padding()
        }
    }
}

#Preview {
    AboutView2()
}

