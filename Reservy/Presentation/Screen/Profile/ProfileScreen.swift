//
//  ProfileScreen.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 30.04.2024.
//

import SwiftUI

struct ProfileScreen: View {
    @StateObject private var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationStack {
            if viewModel.isLoading {
                ProgressView()
            } else if let user = viewModel.user {
                VStack {
                    Image(Assets.iconWithoutBg)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 192, height: 192)
                        .clipShape(Circle())
                        .padding(.top, 20)
                    Text("\(viewModel.user?.firstname ?? "") \(viewModel.user?.lastname ?? "")")
                        .font(.system(size: 24))
                        .fontWeight(.semibold)
                        .padding(.top, 16)
                    Spacer()
                    List {
                        NavigationLink(
                            destination: EditProfileScreen(user: user)
                        ) {
                            ProfileSectionButton(icon: "pencil", text: "Edit Profile")
                        }
                        NavigationLink(destination: ReservationsScreen()) {
                            ProfileSectionButton(icon: "list.bullet", text: "My Reservations")
                        }
                        NavigationLink(destination: PrivacyPolicyScreen()) {
                            ProfileSectionButton(icon: "lock.shield", text: "Privacy Policy")
                        }
                        NavigationLink(destination: TermsAndConditionsScreen()) {
                            ProfileSectionButton(icon: "doc.text", text: "Terms and Conditions")
                        }
                        ProfileSectionButton(icon: "trash", text: "Delete Account")
                            .onTapGesture {
                                Task {
                                    await viewModel.deleteAccount()
                                }
                            }
                    }
                    .scrollContentBackground(.hidden)
                    .scrollDisabled(true)
                    Spacer()
                    PlainButton(label: "Logout", color: Color.red, isLoading: viewModel.isLoading) {
                        viewModel.logout()
                    }
                    .padding(.bottom, 24)
                }
                .padding()
            } else {
                Text(viewModel.errorMessage)
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchUserById()
            }
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(
                title: Text(viewModel.isUserDeleted ? "Success" : "Error"),
                message: Text(viewModel.alertMessage),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

#Preview {
    ProfileScreen()
}

struct ProfileSection {
    let icon: String
    let text: String
}
