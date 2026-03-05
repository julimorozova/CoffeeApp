//
//  CoffeeAppApp.swift
//  CoffeeApp
//
//  Created by Julia Morozova on 27. 2. 2026..
//

import SwiftUI

@main
struct CoffeeAppApp: App {
    @StateObject private var router = AppRouter()

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path) {
                HomeView()
                    .navigationDestination(for: AppRouter.Destination.self) { destination in
                        switch destination {
                        case .detail(let drink):
                            let vm = DetailViewModel(drink: drink)
                            DetailView(viewModel: vm)
                        }
                    }
            }
            .environmentObject(router)
        }
    }
}
