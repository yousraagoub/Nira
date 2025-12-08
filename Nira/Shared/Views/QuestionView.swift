//
//  QuestionView.swift
//  Nira
//
//  Created by Yousra Abdelrahman on 11/06/1447 AH.
//

import SwiftUI
import SwiftData
import Combine

// MARK: - Question View

struct QuestionView: View {
    @ObservedObject var viewModel: QuestionViewModel
    @Binding var path: NavigationPath

    @StateObject private var feedbackViewModel = FeedbackViewModel()

    private let backgroundColor = Color.brightGray
    private let primaryTeal = Color.veryDarkTeal

    var body: some View {
        ZStack {
            backgroundColor.ignoresSafeArea()

            content
                .padding(.horizontal, 32)
                .padding(.vertical, 32)
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Memory Training")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.veryDarkTeal)
            }

            ToolbarItem(placement: .topBarLeading) {
                Button {
                    path = NavigationPath()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.veryDarkTeal)
                }
            }

        }
        .onAppear {
            feedbackViewModel.startQuestion()
        }
        .sheet(isPresented: $feedbackViewModel.showFeedback) {
            FeedbackExactView(
                isCorrect: feedbackViewModel.feedbackIsCorrect,
                duration: feedbackViewModel.duration,
                path: $path
            )
        }
    }

    private var content: some View {
        VStack {
            Spacer()
            questionSection
            Spacer()
            answersSection
            Spacer()
            bottomButtons
        }
    }

    // MARK: - Question Text
    private var questionSection: some View {
        Text(viewModel.question.text)
            .font(.system(size: 28, weight: .semibold))
            .foregroundColor(primaryTeal)
            .multilineTextAlignment(.center)
            .padding(.horizontal)
    }

    // MARK: - Answers
    private var answersSection: some View {
        HStack(spacing: 40) {
            ForEach(viewModel.question.options, id: \.self) { option in
                answerButton(option)
            }
        }
    }

    private func answerButton(_ option: String) -> some View {
        let isSelected = viewModel.selectedOption == option

        return Button {
            withAnimation(.spring(duration: 0.25)) {
                viewModel.selectedOption = option
            }

            // ✅ نحدد إذا الإجابة صحيحة أو لا بناءً على correctOption
            let isCorrect = (option == viewModel.question.correctOption)
            feedbackViewModel.selectAnswer(isCorrect ? .red : .green)

        } label: {
            Text(option)
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(isSelected ? .veryDarkTeal : .white)
                .frame(width: 140, height: 60)
                .background(
                    RoundedRectangle(cornerRadius: 40)
                        .fill(isSelected ? .white : .darkTeal)
                )
                .shadow(radius: 14, y: 8)
        }
        .buttonStyle(.plain)
    }

    // MARK: - Bottom Buttons
    private var bottomButtons: some View {
        HStack {
            Button {
                path.removeLast()
                // show image again (ممكن لاحقًا تربطينها بعرض الصورة)
            } label: {
                Image(systemName: "arrow.backward")
                    .flipsForRightToLeftLayoutDirection(true)
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(Color.veryDarkTeal)
                    .padding(16)
            }
            .buttonStyle(.plain)
            .glassEffect(.regular.interactive().tint(Color.whiteWhite.opacity(0.5)))
            .clipShape(Circle())
            .padding(.bottom, -20)
            

            Spacer()

            Button {
                feedbackViewModel.confirmAnswer()
            } label: {
                Image(systemName: "checkmark")
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(Color.brightGray)
                    .padding(16)
            }
            .buttonStyle(.plain)
            .glassEffect(.clear.interactive().tint(Color.darkTeal))
            .clipShape(Circle())
            .padding(.bottom, -20)
            .disabled(viewModel.selectedOption == nil)
            .opacity(viewModel.selectedOption == nil ? 0.4 : 1)
        }
    }
}


//#Preview {
//    @State var path = NavigationPath()
//
//    let sampleQuestion = MemoryQuestion(
//        text: "How many cups were in the picture?",
//        options: ["Three cups", "Four cups"],
//        relatedImageName: "Image"
//    )
//
//    return NavigationStack(path: $path) {
//        QuestionView(
//            viewModel: QuestionViewModel(question: sampleQuestion),
//            path: $path
//        )
//        .navigationBarBackButtonHidden(true)
//    }
//}
