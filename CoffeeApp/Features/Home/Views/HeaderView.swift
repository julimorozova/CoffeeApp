//
//  Header.swift
//  CoffeeApp
//
//  Created by Julia Morozova on 27. 2. 2026..
//
import SwiftUI

struct HeaderView: View {
    var user: User?
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 6) {
                Text("Good Morning")
                    .poppins(.regular, 16)
                Text(user?.name ?? "...")
                    .poppins(.semiBold, 28)
            }

            Spacer()

            Button {
                //
            } label: {
                ZStack(alignment: .topTrailing) {
                    Image(user?.avatarImage ?? "...")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 48, height: 48)
                        .clipShape(RoundedRectangle(cornerRadius: 15))

                    Circle()
                        .fill(.appOrange)
                        .frame(width: 15, height: 15)
                        .overlay(
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(.white, lineWidth: 2)
                            )
                        .offset(x: 4, y: -2)
                }
            }
        }
        .padding(28)
    }
}
