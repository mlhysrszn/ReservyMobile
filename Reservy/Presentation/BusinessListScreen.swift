//
//  BusinessListScreen.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 28.04.2024.
//

import SwiftUI

struct BusinessListScreen: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(dummyBusinessList, id: \.self) { business in
                    BusinessItemView(business: business)
                }
            }
        }
    }
}

#Preview {
    BusinessListScreen()
}
