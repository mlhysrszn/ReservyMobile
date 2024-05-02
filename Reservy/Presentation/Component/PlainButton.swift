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
    var isLoading: Bool = false
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            ZStack {
                if isLoading {
                    ProgressView()
                }
                Text(label)
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                    .opacity(isLoading ? 0 : 100)
            }
        })
        .foregroundStyle(color ?? .secondaryBlue)
    }
}

#Preview {
    PlainButton(label: "Button Text", action: {})
}
