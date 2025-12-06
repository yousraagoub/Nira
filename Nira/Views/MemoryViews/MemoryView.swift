//
//  MemoryView.swift
//  Nira
//
//  Created by Yousra Abdelrahman on 11/06/1447 AH.
//
import SwiftUI
import SwiftUI

struct MemoryView: View {
    @Binding var path: NavigationPath
    @State private var flipped = false

    // 👇 نختار مجموعة صورة عشوائية عند فتح الشاشة
    @State private var currentSet: MemoryImageSet = memoryImageSets.randomElement() ?? MemoryImageSet(
        imageName: "Image1",
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
                            Image(systemName: "arrow.right")
                                .font(.system(size: 24, weight: .medium))
                                .foregroundColor(.white)
                                .padding(16)
                                .background(Color.darkTeal)
                                .clipShape(Circle())
                        }
                        .glassEffect(.clear)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 12)
                }
            }
            .padding(.horizontal, 20)
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Memory Training")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.veryDarkTeal)
            }

            ToolbarItem(placement: .topBarLeading) {
                ToolbarButtonStyle(systemName: "arrow.left") {
                    if !path.isEmpty {
                        path.removeLast()
                    }
                }
            }
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

let memoryImageSets: [MemoryImageSet] = [
    MemoryImageSet(
        imageName: "Image",   // استبدليه باسم الصورة الأولى في Assets
        questions: [
            MemoryQuestion(
                text: "How many windows were visible?",
                options: ["Six windows", "Five windows"],
                correctOption: "Five windows",
                relatedImageName: "Image 1"
            ),
            MemoryQuestion(
                text: "What type of tree was at the bottom?",
                options: ["Round tree", "Pine tree"],
                correctOption: "Round tree",
                relatedImageName: "Image 1"
            ),
            MemoryQuestion(
                text: "Was the house tilted?",
                options: ["No", "Yes"],
                correctOption: "Yes",
                relatedImageName: "Image 1"
            )
        ]
    ),
    MemoryImageSet(
        imageName: "Image 1",   // استبدليه باسم الصورة الثانية في Assets
        questions: [
            MemoryQuestion(
                text: "How many cups were in the picture?",
                options: ["Three cups", "Four cups"],
                correctOption: "Four cups",
                relatedImageName: "Image"
            ),
            MemoryQuestion(
                text: "How many people had their legs crossed?",
                options: ["One person", "Two person"],
                correctOption: "One person",
                relatedImageName: "Image"
            ),
            MemoryQuestion(
                text: "which hand did the man hold his cup with?",
                options: ["Left hand", "Right hand"],
                correctOption: "Left hand",
                relatedImageName: "Image"
            )
        ]
    )
]


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
