//
//  PromotionView.swift
//  CoffeeApp
//
//  Created by Julia Morozova on 3. 3. 2026..
//

import SwiftUI

struct PromotionView: View {
    var promotions: [Drink]
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            PromotionHeaderView()
            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 6) {

                        ForEach(promotions) { promotion in
                            PromotionCardView(promotion: promotion)
                                .containerRelativeFrame(.horizontal) { width, _ in
                                    width * 0.85
                                }
                                .scrollTransition(.animated(.spring(duration: 0.3))) { content, phase in
                                    content
                                        .opacity(phase.isIdentity ? 1 : 0.6)
                                        .scaleEffect(phase.isIdentity ? 1.0 : 0.8)
                                }
                        }
                    }
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.viewAligned)
                .safeAreaPadding(.horizontal, 28)
            }
        }
    }
}

struct PromotionHeaderView: View {
    var body: some View {
        HStack {
            Text("Promotion")
                .poppins(.medium, 18)

            Spacer()

            Button {
                //
            } label: {
                Text("More")
                    .poppins(.medium, 16)
                    .foregroundColor(.appLightPurpur)
            }
        }
        .padding(.horizontal, 28)
    }
}

struct PromotionCardView: View {
    var promotion: Drink
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(promotion.name)
                .poppins(.semiBold, 18)
                .foregroundColor(.white)

            HStack(spacing: 12) {
                Text("$\(String(promotion.price))")
                    .poppins(.semiBold, 24)
                    .foregroundColor(.white)
                Text("$\(String(promotion.originalPrice ?? 0))")
                    .poppins(.semiBold, 18)
                    .foregroundColor(.appOrange)
                    .strikethrough(true, color: .appOrange)
            }
        }
        .padding(24)
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 187)
        .background(.appDarkPurpur)
        .clipShape(RoundedRectangle(cornerRadius: 22))
    }
}
