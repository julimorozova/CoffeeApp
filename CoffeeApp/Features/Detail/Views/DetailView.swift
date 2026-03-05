//
//  DetailView.swift
//  CoffeeApp
//
//  Created by Julia Morozova on 3. 3. 2026..
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var router: AppRouter
    @StateObject var viewModel: DetailViewModel

    var body: some View {

        VStack(alignment: .center, spacing: 27) {
            ZStack(alignment: .top) {
                Image(viewModel.drink.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 340)
                    .frame(maxWidth: UIScreen.main.bounds.width)
                    .clipped()


                HStack {
                    Button {
                        router.pop()
                    } label: {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 24, height: 24)
                    }
                    .frame(width: 44, height: 44)

                    Spacer()

                    Text("Details")
                        .poppins(.semiBold, 20)
                        .foregroundColor(.white)

                    Spacer()

                    Button {
                        //
                    } label: {
                        Image(systemName: "bookmark")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 24, height: 24)
                    }
                    .frame(width: 44, height: 44)


                }
                .padding(.horizontal, 28)
                .padding(.top, safeAreaTopAnchor())
            }
            .frame(maxWidth: .infinity)

            VStack(alignment: .center, spacing: 16) {
                Text(viewModel.drink.name)
                    .poppins(.semiBold, 18)
                Text(viewModel.drink.description)
                    .poppins(.regular, 14)
            }
            .padding(.horizontal, 28)

            HStack(spacing: 10) {
                ForEach(viewModel.drink.sizes, id: \.self) {size in

                    Button {
                        viewModel.selectSize(size)
                    } label: {
                        SizeCard(size: size, isSelected: size == viewModel.selectedSize)
                    }
                }
            }


            Spacer()

        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarBackButtonHidden(true)
    }

    func safeAreaTopAnchor() -> CGFloat {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        return windowScene?.windows.first?.safeAreaInsets.top ?? 44
    }
}

struct SizeCard: View {
    var size: DrinkSize
    var isSelected: Bool
    var body: some View {
        ZStack {
            Text(size.rawValue)
                .poppins(.regular, 16)
                .foregroundColor(.black)
        }
        .frame(width: 64, height: 64)
        .background(isSelected ? .appOrange : .appLightOrange)
        .clipShape(RoundedRectangle(cornerRadius: 22))
        .overlay(
                RoundedRectangle(cornerRadius: 22)
                    .stroke(.appOrange, lineWidth: 1).clipped()
            )
    }
}






#Preview {
    DetailView(viewModel: DetailViewModel(drink: Drink(
        id: UUID(),
        name: "Hot Sweet Indonesian Tea",
        type: "Tea",
        category: .beverages,
        price: 8.2,
        originalPrice: nil,
        rating: 4.0,
        description: "A warm and soothing blend of Indonesian herbs and spices",
        imageName: "tea2",
        sizes: [.small, .medium, .large, .extraLarge]
    ))  )
}
