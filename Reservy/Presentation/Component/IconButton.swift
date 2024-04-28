//
//  IconButton.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 28.04.2024.
//

import SwiftUI

struct IconButton: View {
    var image: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
                .padding(10)
                .background(Colors.secondaryBlue)
                .foregroundColor(.white)
        }
        .frame(width: 40, height: 40)
        .cornerRadius(8)
    }
}

#Preview {
    VStack {
        IconButton(image: "phone") {}
        IconButton(image: "envelope") {}
        IconButton(image: "location") {}
    }
}
