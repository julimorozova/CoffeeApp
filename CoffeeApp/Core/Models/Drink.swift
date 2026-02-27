//
//  Drink.swift
//  CoffeeApp
//
//  Created by Julia Morozova on 27. 2. 2026..
//
import Foundation

struct Drink: Identifiable, Hashable {
    let id: UUID
    let name: String
    let category: DrinkCategory
    let price: Double
    let originalPrice: Double?
    let rating: Double
    let description: String
    let imageName: String
    let sizes: [DrinkSize]
}

enum DrinkCategory: String, CaseIterable {
    case beverages = "Beverages"
    case foods = "Foods"
}

enum DrinkSize: String, CaseIterable {
    case small = "Sm"
    case medium = "Md"
    case large = "Lr"
    case extraLarge = "Xl"
}


