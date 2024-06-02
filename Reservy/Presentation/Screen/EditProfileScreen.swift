//
//  EditProfileScreen.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 1.05.2024.
//

import SwiftUI

struct EditProfileScreen: View {
    enum Field {
        case firstName
        case lastName
        case email
        case phoneNumber
        case city
    }
    
    let user: User
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var phoneNumber = ""
    @State var city = ""
    @FocusState private var focusedField: Field?

    var body: some View {
        VStack {
            Image(Assets.iconWithoutBg)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 192, height: 192)
                .clipShape(Circle())
                .padding(.top, 20)

            VStack {
                TextField("First Name", text: $firstName)
                    .focused($focusedField, equals: .firstName)
                    .submitLabel(.next)
                    .padding(.vertical, 16)
                    .overlay(Divider().padding(.top, 32))
                
                TextField("Last Name", text: $lastName)
                    .focused($focusedField, equals: .lastName)
                    .submitLabel(.next)
                    .padding(.vertical, 16)
                    .overlay(Divider().padding(.top, 32))
                
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .focused($focusedField, equals: .email)
                    .submitLabel(.next)
                    .padding(.vertical, 16)
                    .overlay(Divider().padding(.top, 32))
                
                TextField("Phone Number", text: $phoneNumber)
                    .focused($focusedField, equals: .phoneNumber)
                    .submitLabel(.next)
                    .padding(.vertical, 16)
                    .overlay(Divider().padding(.top, 32))
                
                TextField("City", text: $city)
                    .focused($focusedField, equals: .city)
                    .submitLabel(.done)
                    .padding(.vertical, 16)
                    .overlay(Divider().padding(.top, 32))
            }
            .onSubmit {
                switch focusedField {
                case .firstName:
                    focusedField = .lastName
                case .lastName:
                    focusedField = .email                
                case .email:
                    focusedField = .phoneNumber                
                case .phoneNumber:
                    focusedField = .city
                default:
                    focusedField = nil
                }
            }
            
            Spacer()
            
            FilledButton(label: "Save") {
                print("Save Clicked")
            }
            .padding(.bottom, 24)
            PlainButton(label: "Delete Account", color: Color.red) {
                print("Delete account Clicked")
            }
            .padding(.bottom, 24)
        }
        .padding(24)
    }
}
