//
//  QuestionViewModel.swift
//  Nira
//
//  Created by Yousra Abdelrahman on 11/06/1447 AH.
//

import SwiftUI
import Combine

// مجموعة: صورة + أسئلتها
struct MemoryImageSet: Identifiable, Hashable {
    let id = UUID()
    let imageName: String
    let questions: [MemoryQuestion]
}

// سؤال واحد مرتبط بصورة
struct MemoryQuestion: Identifiable, Hashable {
    let id = UUID()
    let text: String
    let options: [String]
    let correctOption: String       // ✅ الخيار الصحيح
    let relatedImageName: String    // اسم الصورة في Assets
}

final class QuestionViewModel: ObservableObject {
    @Published var question: MemoryQuestion
    @Published var selectedOption: String?

    init(question: MemoryQuestion) {
        self.question = question
    }
}
