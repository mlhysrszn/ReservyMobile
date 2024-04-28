//
//  BusinessDetailItemRow.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 28.04.2024.
//

import SwiftUI

struct BusinessDetailItemRow: View {
    let title: String
    let subTitle: String
    var iconName: String?
    let action: () -> Void
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                Text(subTitle)
                    .font(.system(size: 14))
                    .fontWeight(.regular)
            }
            Spacer(minLength: 16)
            if iconName != nil {
                IconButton(image: iconName!, action: action)
            }
        }
    }
}

#Preview {
    BusinessDetailItemRow(
        title: "Phone Number",
        subTitle: "+90 535 078",
        iconName: "phone",
        action: {}
    )
}
