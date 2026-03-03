//
//  ContentView.swift
//  CoffeeApp
//
//  Created by Julia Morozova on 27. 2. 2026..
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                if let user = viewModel.user {
                    HeaderView(user: user)
                }
                PromotionView(promotions: viewModel.promotions)
                CategoriesView(categories: viewModel.categories)
                FeaturedBeveragesView(items: viewModel.drinks)
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}



struct CategoriesView: View {
    var categories: [DrinkCategory]
    var body: some View {
        VStack(alignment: .leading,spacing: 20) {
            CategoriesHeaderView()
            HStack(spacing: 20) {
                ForEach(categories, id: \.self) { category in
                    CategoryCardView(category: category)
                }
            }

        }
        .padding(.horizontal, 28)

    }
}

struct CategoriesHeaderView: View {
    var body: some View {
        HStack {
            Text("Categories")
                .poppins(.medium, 18)

        }
    }
}

struct CategoryCardView: View {
    var category: DrinkCategory
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image(.beveragesBg)
                .font(.system(size: 100))
                .foregroundStyle(.white.opacity(0.07))
                .offset(x: 15, y: 15)

            VStack(alignment: .leading, spacing: 16) {

                Image(.beverages)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.white)
                    .frame(width: 38, height: 38)

                Text(category.rawValue)
                    .poppins(.semiBold, 16)
                    .foregroundStyle(.white)

            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(20)

        }
        .frame(width: 149, height: 156)
        .background(.appDarkPurpur)
        .clipShape(RoundedRectangle(cornerRadius: 22))

    }
}



#Preview {
    HomeView()
}
