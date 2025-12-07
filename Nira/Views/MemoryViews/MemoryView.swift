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

    // نعيّن قيمة افتراضية، وبعدين نغيرها في onAppear
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
        .onAppear {
            // 🔁 كل مرة تظهر الشاشة: اختاري set عشوائي + رجّعي الكرت للوضع الأول
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
        imageName: "Image",
        questions: [
            MemoryQuestion(
                text: "How many windows were visible?",
                options: ["Six", "Five"],
                correctOption: "Five",
                relatedImageName: "Image"
            ),
            MemoryQuestion(
                text: "What type of tree was at the bottom?",
                options: ["Round tree", "Pine tree"],
                correctOption: "Round tree",
                relatedImageName: "Image"
            ),
            MemoryQuestion(
                text: "Was the house tilted?",
                options: ["No", "Yes"],
                correctOption: "Yes",
                relatedImageName: "Image"
            )
        ]
    ),
    MemoryImageSet(
        imageName: "Image 1",
        questions: [
            MemoryQuestion(
                text: "How many cups were in the picture?",
                options: ["Three", "Four"],
                correctOption: "Four",
                relatedImageName: "Image 1"
            ),
            MemoryQuestion(
                text: "How many people had their legs crossed?",
                options: ["One", "Two"],
                correctOption: "One",
                relatedImageName: "Image 1"
            ),
            MemoryQuestion(
                text: "Which hand did the man hold his cup with?",
                options: ["Left hand", "Right hand"],
                correctOption: "Left hand",
                relatedImageName: "Image 1"
            )
        ]
    ),
    MemoryImageSet(
        imageName: "Image 2",
        questions: [
            MemoryQuestion(
                text: "How many tulip flowers were in the picture?",
                options: ["Three", "Two"],
                correctOption: "Two",
                relatedImageName: "Image 2"
            ),
            MemoryQuestion(
                text: "What shape is located in the middle of the picture?",
                options: ["Tulip", "Sunflower"],
                correctOption: "Tulip",
                relatedImageName: "Image 2"
            ),
            MemoryQuestion(
                text: "How many tiny flowers?",
                options: ["Five", "Four"],
                correctOption: "Five",
                relatedImageName: "Image 2"
            ),
            MemoryQuestion(
                text: "How many total flowers appear to have five petals?",
                options: ["Five", "Seven"],
                correctOption: "Five",
                relatedImageName: "Image 2"
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
