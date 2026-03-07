//
//  AppRouter.swift
//  CoffeeApp
//
//  Created by Julia Morozova on 3. 3. 2026..
//

import SwiftUI
import Combine

enum Tab: String, CaseIterable {
    case home, cart, favorites, settings

    var icon: String {
        switch self {
        case .home: return "house"
        case .cart: return "bag"
        case .favorites: return "heart"
        case .settings: return "gearshape"
        }
    }
}

final class AppRouter: ObservableObject {
    @Published var path = NavigationPath()
    @Published var selectedTab: Tab = .home

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
