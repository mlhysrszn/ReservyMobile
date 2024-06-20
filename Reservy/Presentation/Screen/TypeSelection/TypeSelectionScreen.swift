//
//  TypeSelectionScreen.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 8.06.2024.
//

import SwiftUI

struct TypeSelectionScreen: View {
    let businessId: Int
    @StateObject var viewModel = TypeSelectionViewModel()

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
            } else {
                List(viewModel.reservationTypes) { type in
                    HStack {
                        Text("\(type.name) - \(type.timePeriod)mins - \(type.price)$")
                            .font(.headline)
                        Spacer()
                        if viewModel.selectedType?.id == type.id {
                            Image(systemName: "checkmark")
                                .foregroundColor(.blue)
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        viewModel.selectedType = type
                    }
                }
                .background(Color.white)
                .scrollContentBackground(.hidden)
            }

            NavigationLink(destination: BookScreen(
                businessId: businessId,
                typeId: viewModel.selectedType?.id ?? -1,
                timePeriod: viewModel.selectedType?.timePeriod ?? 0)
            ) {
                Text("Book Now")
            }
            .disabled(viewModel.selectedType == nil)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Colors.secondaryBlue)
            .foregroundStyle(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .fontWeight(.semibold)
            .padding()
        }
        .navigationTitle("Select Type")
        .background(Color.white)
        .onAppear {
            Task {
                await viewModel.fetchReservationTypes(businessID: businessId)
            }
        }
    }
}

