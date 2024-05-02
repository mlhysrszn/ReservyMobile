//
//  LoginScreen.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 14.03.2024.
//

import SwiftUI

struct LoginScreen: View {
    @EnvironmentObject var authManager: AuthManager
    
    enum Field {
        case email
        case password
    }
    
    @State private var email: String = ""
    @State private var password: String = ""
    @FocusState private var focusedField: Field?
    @State private var isLoading: Bool = false
    
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
                    VStack {
                        Image(Assets.iconWithoutBg)
                            .resizable()
                            .frame(width: 128, height: 128)
                        
                        Text("Reservy")
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                            .padding(.top, -16)
                    }.padding(.top, 32)
                }
                .frame(height: 312, alignment: .top)
                Spacer()
                VStack {
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .focused($focusedField, equals: .email)
                        .textContentType(.emailAddress)
                        .submitLabel(.next)
                        .padding(.vertical, 24)
                        .overlay(Divider().padding(.top, 32))
                    SecureField("Password", text: $password)
                        .focused($focusedField, equals: .password)
                        .textContentType(.password)
                        .submitLabel(.done)
                        .overlay(Divider().padding(.top, 32))
                }
                .padding(.horizontal, 24)
                .onSubmit {
                    switch focusedField {
                    case .email:
                        focusedField = .password
                    default:
                        focusedField = nil
                    }
                }
                Spacer()
                VStack(spacing: 24) {
                    FilledButton(label: "Login", isLoading: isLoading) {
                        Task {
                            do {
                                isLoading = true
                                try await authManager.signIn(
                                    email: email,
                                    password: password
                                )
                            } catch {
                                print(error.localizedDescription)
                            }
                            isLoading = false
                        }
                    }
                    NavigationLink(
                        "Don’t you have an account? Register",
                        destination: RegisterScreen().environmentObject(authManager)
                    )
                        .font(.system(size: 16))
                        .fontWeight(.medium)
                        .foregroundStyle(.secondaryBlue)
                }
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
    LoginScreen()
}
