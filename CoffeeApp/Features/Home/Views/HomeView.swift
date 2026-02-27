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
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}


#Preview {
    HomeView()
}
