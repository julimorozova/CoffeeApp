//
//  DrinkService.swift
//  CoffeeApp
//
//  Created by Julia Morozova on 27. 2. 2026..
//

import Foundation

protocol DrinkServiceProtocol {
    func fetchPromotion() async throws -> [Drink]
    func fetchCategories() async throws -> [DrinkCategory]
    func fetchFeaturedBeverages() async throws -> [Drink]
}

final class DrinkService: DrinkServiceProtocol {
    func fetchPromotion() async throws -> [Drink] {
        Drink.mockPromotions
    }

    func fetchCategories() async throws -> [DrinkCategory] {
        DrinkCategory.allCases
    }

    func fetchFeaturedBeverages() async throws -> [Drink] {
        Drink.mockFeaturedBeverages
    }
}

