import SwiftUI

struct RegisterScreen: View {
    
    enum Field {
        case firstName
        case lastName
        case email
        case phoneNumber
        case password
        case secondPassword
    }
    
    @StateObject private var viewModel = RegisterViewModel()
    @FocusState private var focusedField: Field?
    @Environment(\.dismiss) private var dismiss
    
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
                    TextField("Firstname", text: $viewModel.firstName)
                        .keyboardType(.default)
                        .focused($focusedField, equals: .firstName)
                        .textContentType(.name)
                        .submitLabel(.next)
                        .overlay(Divider().padding(.top, 32))
                    
                    TextField("Lastname", text: $viewModel.lastName)
                        .keyboardType(.default)
                        .focused($focusedField, equals: .lastName)
                        .textContentType(.name)
                        .submitLabel(.next)
                        .overlay(Divider().padding(.top, 32))
                    
                    TextField("Email", text: $viewModel.email)
                        .keyboardType(.emailAddress)
                        .focused($focusedField, equals: .email)
                        .textContentType(.emailAddress)
                        .submitLabel(.next)
                        .overlay(Divider().padding(.top, 32))
                    
                    TextField("Phone Number", text: $viewModel.phoneNumber)
                        .keyboardType(.numberPad)
                        .focused($focusedField, equals: .phoneNumber)
                        .textContentType(.telephoneNumber)
                        .submitLabel(.next)
                        .overlay(Divider().padding(.top, 32))
                    
                    TextField("Password", text: $viewModel.password)
                        .focused($focusedField, equals: .password)
                        .textContentType(.password)
                        .submitLabel(.next)
                        .overlay(Divider().padding(.top, 32))
                    
                    TextField("Password Again", text: $viewModel.secondPassword)
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
                    FilledButton(label: "Register", isLoading: viewModel.isLoading) {
                        Task {
                            await viewModel.register()
                        }
                    }
                    PlainButton(label: "Do you have an account? Login") {
                        dismiss()
                    }
                }
                Spacer()
            }
            .ignoresSafeArea()
            .onTapGesture {
                hideKeyboard()
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
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    RegisterScreen()
}
