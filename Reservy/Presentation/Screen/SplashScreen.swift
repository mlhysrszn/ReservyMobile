//
//  SplashScreen.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 25.02.2024.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            Image(Assets.splashIcon)
                .resizable()
                .frame(width: 256, height: 256)
                .background(Color.white)
        }
    }
}

#Preview {
    SplashScreen()
}
