//
//  AppRouter.swift
//  CoffeeApp
//
//  Created by Julia Morozova on 3. 3. 2026..
//

import SwiftUI
import Combine

final class AppRouter: ObservableObject {
    @Published var path = NavigationPath()

    enum Destination: Hashable {
        case detail(Drink)
    }

    func navigate(to destination: Destination) {
        path.append(destination)
    }

    func pop() {
        path.removeLast()
    }
}
