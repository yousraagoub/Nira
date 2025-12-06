//
//  FeedbackViewModel.swift
//  Nira
//
//  Created by Yousra Abdelrahman on 11/06/1447 AH.
//

import Combine
import Foundation

enum AnswerOption {
    case red
    case green
}

final class FeedbackViewModel: ObservableObject {

    @Published var selectedAnswer: AnswerOption? = nil
    @Published var showFeedback: Bool = false
    @Published var feedbackIsCorrect: Bool = false
    @Published var duration: Double = 0

    private var startTime: Date = Date()

    func startQuestion() {
        startTime = Date()
        selectedAnswer = nil
        showFeedback = false
    }

    func selectAnswer(_ answer: AnswerOption) {
        selectedAnswer = answer
    }

    func confirmAnswer() {
        guard let selectedAnswer else { return }

        let endTime = Date()
        duration = endTime.timeIntervalSince(startTime)

        // ✅ الإجابة الصحيحة = Red
        feedbackIsCorrect = (selectedAnswer == .red)

        showFeedback = true
    }
}
