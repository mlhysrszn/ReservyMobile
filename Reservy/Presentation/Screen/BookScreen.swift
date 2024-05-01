//
//  BookScreen.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 28.04.2024.
//

import SwiftUI

struct BookScreen: View {
    @State private var selectedDate = Date()
    
    var body: some View {
        VStack {
            DatePicker("Select a Date",
                selection: $selectedDate,
                displayedComponents: [.date, .hourAndMinute]
            )
            .datePickerStyle(.graphical)
            Spacer()
            FilledButton(label: "Book Now", width: .infinity) {
                
            }.padding(16)
        }
        .navigationTitle("Book Now")
        .navigationBarTitleDisplayMode(.inline)
        .tint(Colors.secondaryBlue)
    }
}

#Preview {
    BookScreen()
}
