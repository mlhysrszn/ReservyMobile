//
//  LoginScreen.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 14.03.2024.
//

import SwiftUI

struct LoginScreen: View {
    @StateObject private var viewModel = LoginViewModel()
    @FocusState private var focusedField: Field?

    enum Field {
        case email
        case password
    }

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
                    }
                    .padding(.top, 32)
                }
                .frame(height: 312, alignment: .top)
                Spacer()
                VStack {
                    TextField("Email", text: $viewModel.email)
                        .keyboardType(.emailAddress)
                        .focused($focusedField, equals: .email)
                        .textContentType(.emailAddress)
                        .submitLabel(.next)
                        .padding(.vertical, 24)
                        .overlay(Divider().padding(.top, 32))
                    SecureField("Password", text: $viewModel.password)
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
                    FilledButton(label: "Login", isLoading: viewModel.isLoading) {
                        Task {
                            await viewModel.login()
                        }
                    }
                    NavigationLink(
                        "Don’t you have an account? Register",
                        destination: RegisterScreen()
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
            .alert(isPresented: Binding<Bool>(
                get: { viewModel.errorMessage != nil },
                set: { _ in viewModel.errorMessage = nil }
            )) {
                Alert(
                    title: Text("Error"),
                    message: Text(viewModel.errorMessage ?? "Unknown error"),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}

#Preview {
    LoginScreen()
}
