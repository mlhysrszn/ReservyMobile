//
//  PlainButton.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 14.03.2024.
//

import SwiftUI

struct PlainButton: View {
    let label: String
    var color: Color?
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Text(label)
                .font(.system(size: 16))
                .fontWeight(.medium)
        })
        .foregroundStyle(color ?? .secondaryBlue)
    }
}

#Preview {
    PlainButton(label: "Button Text", action: {})
}
