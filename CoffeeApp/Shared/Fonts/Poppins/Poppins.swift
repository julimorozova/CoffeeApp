//
//  Poppins.swift
//  CoffeeApp
//
//  Created by Julia Morozova on 27. 2. 2026..
//

import SwiftUI

enum Poppins: String {
    case regular = "Poppins-Regular"
    case medium =  "Poppins-Medium"
    case semiBold = "Poppins-SemiBold"
}

extension Text {
    func poppins(_ font: Poppins, _ size: CGFloat) -> some View {
        self
            .font(.custom(font.rawValue, size: size))
    }
}

//Family: Poppins Font names: ["Poppins-Regular", "Poppins-Medium", "Poppins-SemiBold"]
