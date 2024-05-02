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
                    .clipShape(RoundedRectangle(cornerRadius: 8))
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
                }
            }
            HStack {
                IconButton(image: "phone") {
                    
                }
                IconButton(image: "envelope") {
                    
                }
                IconButton(image: "location") {
                    
                }
                Spacer()
                PlainButton(
                    label: reservation.actionText, 
                    color: reservation.actionColor
                ) {
                    
                }
                Spacer()
            }
        }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 4, x: 0, y: 4)
        .padding(.horizontal, 16)
    }
}

#Preview {
    ReservationItemView(reservation: dummyReservation)
}
