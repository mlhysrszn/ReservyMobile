//
//  ContentView.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 25.02.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var showSplash = true
    @ObservedObject private var userDefaults = UserDefaultsManager.shared
    
    var body: some View {
        Group {
            if showSplash {
                SplashScreen()
            } else {
                if userDefaults.isUserLoggedIn {
                    HomeScreen()
                } else {
                    LoginScreen()
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.showSplash = false
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
