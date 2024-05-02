//
//  ContentView.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 25.02.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authManager: AuthManager
    @State private var showSplash = true
    
    var body: some View {
        Group {
            if showSplash {
                SplashScreen()
            } else {
                if authManager.isUserSignedIn {
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
