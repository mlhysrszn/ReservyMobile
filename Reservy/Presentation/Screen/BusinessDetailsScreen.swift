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
        NavigationStack {
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
                        if let rating = business.rating {
                            Text(String(rating))
                                .font(.system(size: 12))
                                .padding(.trailing, 4)
                        }
                        Image(systemName: "star")
                            .resizable()
                            .frame(width: 16, height: 16)
                    }
                    .padding(.bottom, 8)
                    .padding(.top, -8)
                    if let phoneNumber = business.phoneNumber {
                        BusinessDetailItemRow(
                            title: "Phone Number",
                            subTitle: phoneNumber,
                            iconName: "phone",
                            action: {}
                        )
                    }
                    if let mail = business.email {
                        BusinessDetailItemRow(
                            title: "Mail",
                            subTitle: mail,
                            iconName: "envelope",
                            action: {}
                        )
                    }
                    BusinessDetailItemRow(
                        title: "Address",
                        subTitle: business.address,
                        iconName: "location",
                        action: {}
                    )
                    BusinessDetailItemRow(
                        title: "Working Hours",
                        subTitle: business.allWorkingHours(),
                        action: {}
                    )
                    NavigationLink("Book Now") {
                        BookScreen(business: business)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Colors.secondaryBlue)
                    .foregroundStyle(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .fontWeight(.semibold)
                    .padding(.vertical, 16)
                }
                .padding(16)
            }
            .navigationTitle(business.name)
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}
