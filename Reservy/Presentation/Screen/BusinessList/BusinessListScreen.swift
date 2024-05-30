//
//  BusinessListScreen.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 28.04.2024.
//

import SwiftUI

struct BusinessListScreen: View {
    @StateObject private var viewModel = BusinessListViewModel()
    
    var body: some View {
        NavigationStack {
            if viewModel.isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
            } else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            } else {
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.businesses, id: \.id) { business in
                            NavigationLink(
                                destination: BusinessDetailsScreen(business: business)) {
                                BusinessItemView(business: business)
                            }.buttonStyle(PlainButtonStyle())
                        }
                    }
                    
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchBusinesses()
            }
        }
    }
}

#Preview {
    BusinessListScreen()
}
