//
//  FeaturedBeveragesView.swift
//  CoffeeApp
//
//  Created by Julia Morozova on 3. 3. 2026..
//

import SwiftUI

struct FeaturedBeveragesView: View {
    var items: [Drink]
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            FeaturedBeveragesHeaderView()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(items) { item in
                        FeaturedBeverageCardView(item: item)
                    }
                }
                .padding(.horizontal, 28)
            }
        }

    }
}

struct FeaturedBeverageCardView: View {
    var item: Drink
    @EnvironmentObject var router: AppRouter

    var body: some View {
        Button {
            router.navigate(to: .detail(item))
        } label: {
            VStack(alignment: .leading, spacing: 17) {
                ZStack(alignment: .bottomTrailing) {
                    Image(item.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 205, height: 126)
                        .clipShape(RoundedRectangle(cornerRadius: 22))
                    Button {
                        // action
                    } label: {
                        Image(systemName: "bag")
                            .resizable()
                            .scaledToFit()
                            .padding(17)
                            .foregroundStyle(.black)
                            .frame(width: 58, height: 58)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 22))
                            .shadow(color: .black.opacity(0.1), radius: 8, y: 4)
                            .padding(.trailing, 10)
                            .offset(y: 29)
                    }
                }
                .frame(width: 205)


                VStack(alignment: .leading, spacing: 7) {
                    Text(item.type)
                        .poppins(.regular, 14)
                    Text(item.name)
                        .poppins(.semiBold, 16)
                        .lineLimit(2)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .frame(maxWidth: 150, alignment: .leading)

                // цена и рейтинг
                HStack(spacing: 6) {
                    Text("$\(item.price, specifier: "%.1f")")
                        .poppins(.semiBold, 18)

                   Circle()
                       .frame(width: 5, height: 5)
                       .foregroundStyle(.secondary)

                   Image(systemName: "star")
                       .font(.system(size: 12))


                    Text(String(format: "%.1f", item.rating))
                        .poppins(.regular, 18)
                        .foregroundStyle(.secondary)
                }
            }
            .frame(width: 205, height: 263, alignment: .top)
        }
        .buttonStyle(.plain) 


    }
}

struct FeaturedBeveragesHeaderView: View {
    var body: some View {
        HStack {
            Text("Featured Beverages")
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
