//
//  ReservationItemView.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 2.05.2024.
//

import SwiftUI

struct ReservationItemView: View {
    var reservation: Reservation
    
    var body: some View {
        VStack {
            HStack(alignment: VerticalAlignment.top) {
                Image(Assets.businessIcon)
                    .resizable()
                    .frame(maxWidth: 96, maxHeight: 96)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                VStack(alignment: HorizontalAlignment.leading, spacing: 0) {
                    HStack {
                        Text(reservation.business.name)
                            .font(.system(size: 18))
                        .fontWeight(.semibold)
                        Spacer()
                        if reservation.isActive {
                            Text("Active")
                                .font(.system(size: 12))
                                .foregroundStyle(Color.green)
                                .fontWeight(.medium)
                        }
                    }
                    Text(reservation.date)
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                        .padding(.bottom, 2)
                    Text(reservation.business.address)
                        .font(.system(size: 12))
                        .fontWeight(.regular)
                        .lineLimit(2)
                }
            }
            HStack {
                IconButton(image: "phone") {
                    print("Phone button clicked")
                }
                IconButton(image: "envelope") {
                    print("Envelope button clicked")
                }
                IconButton(image: "location") {
                    print("Location button clicked")
                }
                Spacer()
                PlainButton(
                    label: reservation.actionText, 
                    color: reservation.actionColor
                ) {
                    print("Action button clicked")
                }
                Spacer()
            }
        }
        .padding(12)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 4, x: 0, y: 4)
        .padding(.horizontal, 16)
    }
}

#Preview {
    ReservationItemView(reservation: dummyReservation)
}
