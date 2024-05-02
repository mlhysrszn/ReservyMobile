//
//  HomeScreen.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 28.04.2024.
//

import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject var authManager: AuthManager
    
    var body: some View {
        TabView {
            BusinessListScreen()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileScreen()
                .environmentObject(authManager)
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }.tint(Color.secondaryBlue)
    }
}

#Preview {
    HomeScreen()
}
