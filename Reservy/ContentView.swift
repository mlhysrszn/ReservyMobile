//
//  ContentView.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 25.02.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var showSplash = true
    
    var body: some View {
        Group {
            if showSplash {
                SplashScreen()
            } else {
                LoginScreen()
            }
        }.onAppear {
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
