//
//  NavigationViewModel.swift
//  Nira
//
//  Created by Yousra Abdelrahman on 12/06/1447 AH.
//
import Combine
import SwiftUI

class NavigationViewModel: ObservableObject {
    @Published var path: [NavigationRoute] = []

    func navigate(to route: NavigationRoute) {
        path.append(route)
    }
    
    func setRoot(to route: NavigationRoute) {
            path = [route]
        }

    func goHome() {
        path = [.home]
    }
}
