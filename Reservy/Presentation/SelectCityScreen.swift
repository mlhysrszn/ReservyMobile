//
//  SelectCityScreen.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 28.04.2024.
//

import SwiftUI

struct SelectCityScreen: View {
    @State private var city: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                ZStack {
                    VStack(spacing: 0) {
                        Rectangle()
                            .fill(.primaryBlue)
                        Ellipse()
                            .trim(from: 0, to: 0.5)
                            .fill(.primaryBlue)
                            .frame(maxWidth: .infinity, maxHeight: 144)
                            .padding(.top, -72)
                    }
                    Text("Please select your city")
                        .fontWeight(.semibold)
                        .font(.title)
                        .padding(.top, 72)
                }
                .frame(height: 312, alignment: .top)
                Spacer()
                VStack {
                    TextField("City", text: $city)
                        .keyboardType(.default)
                        .submitLabel(.done)
                        .padding(.vertical, 24)
                        .overlay(Divider().padding(.top, 32))
                }
                .padding(.horizontal, 24)
                Spacer()
                NavigationLink("Select",destination: HomeScreen())
                    .foregroundColor(.white)
                    .padding(.all, 4)
                    .buttonStyle(.bordered)
                    .background(.secondaryBlue)
                    .cornerRadius(8)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .font(.system(size: 18, weight: .medium))
                    .padding(.all, 4)
                Spacer()
            }
            .ignoresSafeArea()
            .onTapGesture {
                self.hideKeyboard()
            }
        }
    }
}

#Preview {
    SelectCityScreen()
}
