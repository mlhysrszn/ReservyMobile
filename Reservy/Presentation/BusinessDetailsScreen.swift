//
//  BusinessDetailsScreen.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 28.04.2024.
//

import SwiftUI

struct BusinessDetailsScreen: View {
    let business: Business
    
    var body: some View {
        ScrollView {
            Image(Assets.splashIcon)
                .resizable()
                .frame(maxHeight: 216)
            VStack(spacing: 8) {
                HStack(spacing: 0) {
                    Text(business.name)
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .padding(.trailing, 4)
                    Spacer()
                    Text(String(business.rating))
                        .font(.system(size: 12))
                        .padding(.trailing, 4)
                    Image(systemName: "star")
                        .resizable()
                        .frame(width: 16, height: 16)
                }
                .padding(.bottom, 8)
                .padding(.top, -8)
                BusinessDetailItemRow(
                    title: "Phone Number",
                    subTitle: business.phoneNumber,
                    iconName: "phone",
                    action: {}
                )
                BusinessDetailItemRow(
                    title: "Mail",
                    subTitle: business.mail,
                    iconName: "envelope",
                    action: {}
                )
                BusinessDetailItemRow(
                    title: "Address",
                    subTitle: business.address,
                    iconName: "location",
                    action: {}
                )
                BusinessDetailItemRow(
                    title: "Working Hours",
                    subTitle: "Working hours will be implemented",
                    action: {}
                )
                FilledButton(label: "Book Now", width: .infinity) {
                    
                }
                .padding(.vertical, 16)
            }
            .padding(16)
        }.navigationTitle(business.name)
    }
}

#Preview {
    BusinessDetailsScreen(business: dummyBusinessItem)
}
