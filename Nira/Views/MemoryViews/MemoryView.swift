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
                            Image(systemName: "arrow.forward")
                                .flipsForRightToLeftLayoutDirection(true)
                                .font(.system(size: 24, weight: .medium))
                                .foregroundColor(Color.brightGray)
                                .padding(16)
                                
                        }
                        .buttonStyle(.plain)
                        .glassEffect(.clear.interactive().tint(Color.darkTeal))
                        .clipShape(Circle())
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 12)
                }
            }
            .padding(.horizontal, 20)
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Memory")
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
            ToolbarItem(placement: .topBarTrailing) {
                ToolbarButtonStyle(systemName: "info") {
                    path.append("aboutMemory")
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
                text: String(localized:"How many windows were visible?"),
                options: [String(localized:"Six"), String(localized:"Five")],
                correctOption: String(localized:"Five"),
                relatedImageName: "Image"
            ),
            MemoryQuestion(
                text: String(localized:"What type of tree was at the bottom?"),
                options: [String(localized:"Round tree"), String(localized:"Pine tree")],
                correctOption: String(localized:"Round tree"),
                relatedImageName: "Image"
            ),
            MemoryQuestion(
                text: String(localized:"Was the house tilted?"),
                options: [String(localized:"No"), String(localized:"Yes")],
                correctOption: String(localized:"Yes"),
                relatedImageName: "Image"
            )
        ]
    ),
    MemoryImageSet(
        imageName: "Image 1",
        questions: [
            MemoryQuestion(
                text: String(localized:"How many cups were in the picture?"),
                options: [String(localized:"Three"), String(localized:"Four")],
                correctOption: String(localized:"Four"),
                relatedImageName: "Image 1"
            ),
            MemoryQuestion(
                text: String(localized:"How many people had their legs crossed?"),
                options: [String(localized:"One"), String(localized:"Two")],
                correctOption: String(localized:"One"),
                relatedImageName: "Image 1"
            ),
            MemoryQuestion(
                text: String(localized:"Which hand did the man hold his cup with?"),
                options: [String(localized:"Left hand"), String(localized:"Right hand")],
                correctOption: String(localized:"Left hand"),
                relatedImageName: "Image 1"
            )
        ]
    ),
    MemoryImageSet(
        imageName: "Image 2",
        questions: [
            MemoryQuestion(
                text: String(localized:"How many tulip flowers were in the picture?"),
                options: [String(localized:"Three"), String(localized:"Two")],
                correctOption: String(localized:"Two"),
                relatedImageName: "Image 2"
            ),
            MemoryQuestion(
                text: String(localized:"What shape is located in the middle of the picture?"),
                options: [String(localized:"Tulip"), String(localized:"Sunflower")],
                correctOption: String(localized:"Tulip"),
                relatedImageName: "Image 2"
            ),
            MemoryQuestion(
                text: String(localized:"How many tiny flowers?"),
                options: [String(localized:"Five"), String(localized:"Four")],
                correctOption: String(localized:"Five"),
                relatedImageName: "Image 2"
            ),
            MemoryQuestion(
                text: String(localized:"How many total flowers appear to have five petals?"),
                options: [String(localized:"Five"), String(localized:"Seven")],
                correctOption: String(localized:"Five"),
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
