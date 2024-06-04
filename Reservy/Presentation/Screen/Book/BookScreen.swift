//
//  BookScreen.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 28.04.2024.
//

import SwiftUI

struct BookScreen: View {
    var business: Business
    @StateObject private var viewModel = BookViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack {
                DatePicker(
                    "Select a Date",
                    selection: $viewModel.selectedDate,
                    in: .now...,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.graphical)
                .onChange(of: viewModel.selectedDate) { oldValue, newValue in
                    if newValue != oldValue {
                        Task {
                            await viewModel.fetchAvailablePeriods(businessID: business.id)
                        }
                    }
                }
                Spacer()
                if viewModel.isHoursLoading {
                    ProgressView()
                } else if !viewModel.errorMessage.isEmpty && !viewModel.showAlert {
                    Text(viewModel.errorMessage)
                }
                else {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: 16) {
                        ForEach(viewModel.availableHours, id: \.self) { hour in
                            Button(action: {
                                viewModel.selectedHour = hour
                            }) {
                                Text(hour.time)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(hour.enabled ? (viewModel.selectedHour == hour ? Color.secondaryBlue : Color.white) : Color.red)
                                    .foregroundColor(hour.enabled ? (viewModel.selectedHour == hour ? Color.white : Color.secondaryBlue) : Color.white)
                                    .cornerRadius(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(hour.enabled ? Color.secondaryBlue : Color.red, lineWidth: 2)
                                    )
                            }
                            .disabled(!hour.enabled)
                        }
                    }
                    .padding(.horizontal, 16)
                }
                if !viewModel.availableHours.isEmpty {
                    FilledButton(label: "Book Now", width: .infinity, isLoading: viewModel.isLoading) {
                        Task {
                            await viewModel.book(business: business)
                        }
                    }
                    .padding(16)
                }
            }
        }
        .navigationTitle("Book Now")
        .navigationBarTitleDisplayMode(.inline)
        .tint(Colors.secondaryBlue)
        .alert(isPresented: $viewModel.showAlert) {
            Alert(
                title: Text(viewModel.bookingSuccessful ? "Booking success!" : "Error"),
                message: Text(viewModel.alertMessage),
                dismissButton: .default(Text("OK")) {
                    if viewModel.bookingSuccessful {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            )
        }
        .onAppear {
            Task {
                await viewModel.fetchAvailablePeriods(businessID: business.id)
            }
        }
    }
}
