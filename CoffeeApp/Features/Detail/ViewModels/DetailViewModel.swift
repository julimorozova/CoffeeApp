//
//  DetailViewModel.swift
//  CoffeeApp
//
//  Created by Julia Morozova on 5. 3. 2026..
//

import Combine
import SwiftUI



final class DetailViewModel: ObservableObject {
    @Published var drink: Drink
    @Published var selectedSize: DrinkSize
    @Published var count: Int = 1

    init(drink: Drink, selectedSize: DrinkSize = .medium) {
        self.drink = drink
        self.selectedSize = selectedSize
    }

    func selectSize(_ size: DrinkSize) {
        withAnimation(.spring(response: 0.4, dampingFraction: 0.6)) {
            selectedSize = size
        }
    }

    func increment() {
            count += 1
    }

    func decrement() {
        if count > 1 {
            count -= 1
        }
    }

    var formattedPrice: String {
        let total = drink.price * Double(count)
        return String(format: "$%.2f", total)
    }
}
