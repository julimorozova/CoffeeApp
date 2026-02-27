//
//  HomeViewModel.swift
//  CoffeeApp
//
//  Created by Julia Morozova on 27. 2. 2026..
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    @Published var drinks: [Drink] = []
    @Published var promotions: [Drink] = []
    @Published var categories: [DrinkCategory] = []
    @Published var user: User?

    private let drinkService: DrinkServiceProtocol
    private let userService: UserServiceProtocol

    init(drinkService: DrinkServiceProtocol = DrinkService(),
         userService: UserServiceProtocol = UserService()
    ) {
        self.drinkService = drinkService
        self.userService = userService
    }

    func onAppear() {
        Task { await loadData() }
    }

    private func loadData() async {
        do {
            async let drinks = drinkService.fetchFeaturedBeverages()
            async let promotions = drinkService.fetchPromotion()
            async let categories = drinkService.fetchCategories()
            async let user = userService.fetchCurrentUser()

            self.drinks = try await drinks
            self.promotions = try await promotions
            self.categories = try await categories
            self.user = try await user

        } catch {
            print(error)
        }
    }
}
