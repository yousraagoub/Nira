//  MemoryView.swift
//  Nira
//
//  Created by Yousra Abdelrahman on 11/06/1447 AH.
//
import SwiftUI
struct MemoryView: View {
    @Binding var path: NavigationPath
    @State private var flipped = false
        @State private var currentSet: MemoryImageSet = memoryImageSets.first ?? MemoryImageSet(
        imageName: "Image",
        questions: []
    )
    var body: some View {
        ZStack {
            Color.brightGray.ignoresSafeArea()
            
            VStack {
                Spacer()
                
                MemoryCardView(
                    flipped: $flipped,
                    frontImage: Image(currentSet.imageName)   // ← الصورة العشوائية
                )
                
                
                Spacer()
                
                if flipped {
                    HStack {
                        Spacer()
                        
                        Button {
                            // 👇 نختار سؤال عشوائي من أسئلة هذه الصورة
                            if let randomQuestion = currentSet.questions.randomElement() {
                                path.append(randomQuestion)
                            }
                            
                        } label: {
                            Image(systemName: "checkmark")
                                .font(.system(size: 24, weight: .medium))
                                .foregroundColor(Color.brightGray)
                                .frame(width: 44, height: 44)

                            
                        }
                        .buttonStyle(.plain)
                        .glassEffect(.clear.interactive().tint(Color.darkTeal))
                        .clipShape(Circle())
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 16)
                }
            }
            .padding(.horizontal, 16)
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Memory Training")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.veryDarkTeal)
            }
            
            ToolbarItem(placement: .topBarLeading) {
                ToolbarButtonStyle(systemName: "xmark") {
                    if !path.isEmpty {
                        path.removeLast()
                    }
                }
            }
        }
        .onAppear {
            if let randomSet = memoryImageSets.randomElement() {
                currentSet = randomSet
            }
            flipped = false
        }
    }
}

struct MemoryCardView: View {
    @Binding var flipped: Bool
    var frontImage: Image = Image(systemName: "photo")
    var backColor: Color = .gray.opacity(0.2)
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50)
                .fill(backColor)
                .overlay(
                    Text("Flip and Memorize")
                        .foregroundColor(.gray)
                        .font(.headline)
                )
                .opacity(flipped ? 0 : 1)
            
            frontImage
                .resizable()
                .frame(width: 360, height: 260)
                .scaledToFill()
                .clipped()
                .cornerRadius(50)
                .opacity(flipped ? 1 : 0)
        }
        .frame(width: 160, height: 260)
        .rotation3DEffect(
            .degrees(flipped ? 180 : 0),
            axis: (x: 0, y: 1, z: 0)
        )
        .animation(.easeInOut(duration: 0.6), value: flipped)
        .onTapGesture {
            flipped.toggle()
        }
    }
}



struct MemoryView_PreviewWrapper: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            MemoryView(path: $path).navigationBarBackButtonHidden(true)
            
        }
    }
}

#Preview {
    MemoryView_PreviewWrapper()
}
