//
//  onboardingState.swift
//  Nira
//
//  Created by Yousra Abdelrahman on 20/06/1447 AH.
//
import SwiftUI

struct OnboardingState {
    @AppStorage("hasSeenAbout") static var hasSeenAbout: Bool = false
    @AppStorage("hasSeenAboutEye") static var hasSeenAboutEye: Bool = false
    @AppStorage("hasSeenAboutMemory") static var hasSeenAboutMemory: Bool = false
}

