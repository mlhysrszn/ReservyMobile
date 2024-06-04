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
                VStack {
                    Picker("Select City", selection: $viewModel.selectedCity) {
                        Text("All Cities").tag(String?.none)
                        ForEach(viewModel.cities, id: \.self) { city in
                            Text(city).tag(String?(city))
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .padding(.horizontal)
                    TextField("Search...", text: $viewModel.searchQuery)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.horizontal)
                    ScrollView {
                        LazyVStack {
                            ForEach(viewModel.filteredBusinesses, id: \.id) { business in
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
