//
//  Drink.swift
//  CoffeeApp
//
//  Created by Julia Morozova on 27. 2. 2026..
//

import Foundation

extension Drink {
    static let mockFeaturedBeverages: [Drink] = [
        Drink(
            id: UUID(),
            name: "Hot Sweet Indonesian Tea",
            category: .beverages,
            price: 8.2,
            originalPrice: nil,
            rating: 4.0,
            description: "A warm and soothing blend of Indonesian herbs and spices",
            imageName: "tea",
            sizes: [.small, .medium, .large, .extraLarge]
        ),
        Drink(
            id: UUID(),
            name: "Original Coffee Latte",
            category: .beverages,
            price: 12.6,
            originalPrice: nil,
            rating: 3.8,
            description: "Classic espresso with steamed milk and light foam",
            imageName: "latte",
            sizes: [.small, .medium, .large]
        ),
        Drink(
            id: UUID(),
            name: "Matcha Green Tea",
            category: .beverages,
            price: 7.5,
            originalPrice: nil,
            rating: 4.5,
            description: "Premium Japanese matcha with oat milk",
            imageName: "matcha",
            sizes: [.small, .medium, .large, .extraLarge]
        ),
        Drink(
            id: UUID(),
            name: "Caramel Macchiato",
            category: .beverages,
            price: 9.8,
            originalPrice: nil,
            rating: 4.2,
            description: "Espresso with vanilla syrup, milk and caramel drizzle",
            imageName: "macchiato",
            sizes: [.medium, .large, .extraLarge]
        ),
    ]

    static let mockPromotions: [Drink] = [
        Drink(
            id: UUID(),
            name: "Hot Mocha Cappuccino Latte",
            category: .beverages,
            price: 6.7,
            originalPrice: 9.5,
            rating: 4.7,
            description: "Rich mocha blended with creamy cappuccino",
            imageName: "mocha",
            sizes: [.small, .medium, .large, .extraLarge]
        ),
        Drink(
            id: UUID(),
            name: "Iced Caramel Latte",
            category: .beverages,
            price: 5.9,
            originalPrice: 8.0,
            rating: 4.3,
            description: "Cold brew with caramel and fresh milk",
            imageName: "iced_latte",
            sizes: [.small, .medium, .large]
        ),
        Drink(
            id: UUID(),
            name: "Vanilla Cold Brew",
            category: .beverages,
            price: 7.2,
            originalPrice: 10.0,
            rating: 4.6,
            description: "Smooth cold brew with vanilla syrup",
            imageName: "cold_brew",
            sizes: [.medium, .large, .extraLarge]
        ),
    ]
}
