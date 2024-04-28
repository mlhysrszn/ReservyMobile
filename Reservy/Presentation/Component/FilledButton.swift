//
//  FilledButton.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 14.03.2024.
//

import SwiftUI

struct FilledButton: View {
    let label: String
    var width: CGFloat?
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Text(label)
                .font(.system(size: 18, weight: .medium))
                .padding(.all, 4)
                .frame(maxWidth: width)
        })
        .foregroundColor(.white)
        .buttonStyle(.bordered)
        .background(.secondaryBlue)
        .cornerRadius(8)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    FilledButton(label: "Button Label", action: {})
}
