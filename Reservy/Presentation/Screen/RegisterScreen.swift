//
//  RegisterScreen.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 17.03.2024.
//

import SwiftUI

struct RegisterScreen: View {
    @EnvironmentObject var authManager: AuthManager
    
    enum Field {
        case firstName
        case lastName
        case email
        case phoneNumber
        case password
        case secondPassword
    }
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var phoneNumber: String = ""
    @State private var password: String = ""
    @State private var secondPassword: String = ""
    @FocusState private var focusedField: Field?
    @Environment(\.dismiss) private var dismiss
    @State private var isLoading = false
    
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
                    Text("Reservy")
                        .fontWeight(.semibold)
                        .font(.largeTitle)
                        .padding(.top, 32)
                }
                .frame(height: 192, alignment: .top)
                Spacer()
                VStack(spacing: 36) {
                    TextField("Firstname", text: $firstName)
                        .keyboardType(.default)
                        .focused($focusedField, equals: .firstName)
                        .textContentType(.name)
                        .submitLabel(.next)
                        .overlay(Divider().padding(.top, 32))
                    
                    TextField("Lastname", text: $lastName)
                        .keyboardType(.default)
                        .focused($focusedField, equals: .lastName)
                        .textContentType(.name)
                        .submitLabel(.next)
                        .overlay(Divider().padding(.top, 32))
                    
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .focused($focusedField, equals: .email)
                        .textContentType(.emailAddress)
                        .submitLabel(.next)
                        .overlay(Divider().padding(.top, 32))
                    
                    TextField("Phone Number", text: $phoneNumber)
                        .keyboardType(.numberPad)
                        .focused($focusedField, equals: .phoneNumber)
                        .textContentType(.telephoneNumber)
                        .submitLabel(.next)
                        .overlay(Divider().padding(.top, 32))
                    
                    SecureField("Password", text: $password)
                        .focused($focusedField, equals: .password)
                        .textContentType(.password)
                        .submitLabel(.next)
                        .overlay(Divider().padding(.top, 32))
                    
                    SecureField("Password Again", text: $secondPassword)
                        .focused($focusedField, equals: .secondPassword)
                        .textContentType(.password)
                        .submitLabel(.done)
                        .overlay(Divider().padding(.top, 32))
                }
                .padding(.horizontal, 24)
                .onSubmit {
                    switch focusedField {
                        case .firstName:
                            focusedField = .lastName
                        case .lastName:
                            focusedField = .email
                        case .email:
                            focusedField = .phoneNumber
                        case .phoneNumber:
                            focusedField = .password
                        case .password:
                            focusedField = .secondPassword
                        default:
                            focusedField = nil
                    }
                }
                Spacer()
                VStack(spacing: 24) {
                    FilledButton(label: "Register") {
                        Task {
                            do {
                                isLoading = true
                                try await authManager.signUp(
                                    firstName: firstName,
                                    lastName: lastName,
                                    email: email,
                                    phoneNumber: phoneNumber,
                                    password: password
                                )
                            } catch {
                                print(error)
                            }
                            isLoading = false
                        }
                    }
                    PlainButton(label: "Do you have an account? Login") {
                        print("Login clicked")
                        dismiss()
                    }
                }
                Spacer()
            }
            .ignoresSafeArea()
            .onTapGesture {
                self.hideKeyboard()
            }
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    RegisterScreen()
}
