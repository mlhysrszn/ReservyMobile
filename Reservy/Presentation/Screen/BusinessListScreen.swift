//
//  BusinessListScreen.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 28.04.2024.
//

import SwiftUI

struct BusinessListScreen: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(dummyBusinessList, id: \.self) { business in
                        NavigationLink(
                            destination: BusinessDetailsScreen(business: business)) {
                            BusinessItemView(business: business)
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
    }
}

#Preview {
    BusinessListScreen()
}
