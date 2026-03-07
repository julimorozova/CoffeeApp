//
//  TabBar.swift
//  CoffeeApp
//
//  Created by Julia Morozova on 6. 3. 2026..
//

import SwiftUI

struct TabBar: View {
    @EnvironmentObject var router: AppRouter

    init() {
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $router.selectedTab) {
                HomeView()
                    .tag(Tab.home)
            }

            CustomTabBar()
        }

        .toolbar(.hidden, for: .tabBar)
    }
}

struct CustomTabBar: View {
    @EnvironmentObject var router: AppRouter

    var body: some View {
        HStack {
            ForEach(Tab.allCases, id: \.self) { tab in
                Spacer()

                Button {
                    withAnimation(.spring()) {
                        router.selectedTab = tab
                    }
                } label: {
                    VStack(spacing: 4) {
                        Image(systemName: router.selectedTab == tab ? "\(tab.icon).fill" : tab.icon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)


                        if router.selectedTab == tab {
                            Capsule()
                                .fill(Color.black)
                                .frame(width: 8, height: 10)
                                .offset(y: 3)
                                .frame(width: 8, height: 6)
                                .clipped()
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundColor(router.selectedTab == tab ? .black : .gray)

                }
                Spacer()
            }
        }
        .frame(height: 80)
        .background(Color.white)
    }
}
