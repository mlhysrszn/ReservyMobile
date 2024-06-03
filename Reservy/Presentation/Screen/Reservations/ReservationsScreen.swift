//
//  ReservationsScreen.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 2.05.2024.
//

import SwiftUI

struct ReservationsScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var viewModel = ReservationsViewModel()
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
            } else if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage)
            } else {
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(viewModel.reservations, id: \.self.id) { reservation in
                            ReservationItemView(viewModel: viewModel, reservation: reservation)
                        }
                    }
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchReservations()
            }
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(
                title: Text("Success"),
                message: Text(viewModel.successMessage),
                dismissButton: .default(Text("OK")) {
                    presentationMode.wrappedValue.dismiss()
                }
            )
        }
        .navigationTitle("Reservations")
        .navigationBarTitleDisplayMode(.inline)
    }
}
