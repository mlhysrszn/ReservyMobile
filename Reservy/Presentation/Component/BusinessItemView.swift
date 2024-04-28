//
//  BusinessItemView.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 28.04.2024.
//

import SwiftUI

struct BusinessItemView: View {
    let business: Business
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
            Colors.primaryBlue
            VStack(spacing: 0) {
                Image(Assets.splashIcon)
                    .resizable()
                    .frame(maxHeight: 172)
                Spacer()
                VStack(alignment: .leading, spacing: 0) {
                    HStack(spacing: 0) {
                        Text(business.name)
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                            .padding(.trailing, 4)
                        Text(business.openHours)
                            .font(.system(size: 10))
                            .fontWeight(.light)
                        Spacer()
                        Text(String(business.rating))
                            .font(.system(size: 12))
                            .padding(.trailing, 4)
                        Image(systemName: "star")
                            .resizable()
                            .frame(width: 16, height: 16)
                    }
                    Text(business.address)
                        .font(.system(size: 14))
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                Spacer()
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .padding(.horizontal, 16)
    }
}

#Preview {
    BusinessItemView(
        business: Business(
        id: 0,
        name: "Beauty Center",
        openHours: "09.00 - 18.00",
        rating: 3.5,
        address: "Şükrüpaşa Mahallesi Hasan Maksutoğlu Caddesi No:24 Kat: 1 Daire: 1 Merkez/EDİRNE"
        )
    )
}
