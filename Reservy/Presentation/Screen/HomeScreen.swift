//
//  HomeScreen.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 28.04.2024.
//

import SwiftUI

struct HomeScreen: View {
    
    var body: some View {
        TabView {
            BusinessListScreen()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileScreen()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }.tint(Color.secondaryBlue)
    }
}

#Preview {
    HomeScreen()
}
