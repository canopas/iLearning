//
//  HomeView.swift
//  iLearning
//
//  Created by Amisha Italiya on 10/11/22.
//

import SwiftUI
import UIPilot

struct HomeView: View {

    @EnvironmentObject var pilot: UIPilot<AppRoute>

    var body: some View {
        TabView {
            FeaturedView()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }

            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }

            WishlistView()
                .tabItem {
                    Label("Wishlist", systemImage: "heart")
                }

            AccountView(viewModel: AccountViewModel(pilot: pilot))
                .tabItem {
                    Label("Account", systemImage: "person.crop.circle")
                }
        }
        .accentColor(R.color.appDarkColor.color)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
