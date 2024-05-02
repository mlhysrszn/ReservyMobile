//
//  ProfileScreen.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 30.04.2024.
//

import SwiftUI

struct ProfileScreen: View {
    @EnvironmentObject var authManager: AuthManager
    @State private var isLoading: Bool = false
    
    let sections = [
        ProfileSection(icon: "pencil", text: "Edit Profile"),
        ProfileSection(icon: "list.bullet", text: "My Reservations"),
        ProfileSection(icon: "lock.shield", text: "Privacy Policy"),
        ProfileSection(icon: "doc.text", text: "Terms and Conditions"),
        ProfileSection(icon: "star", text: "Rate Us"),
        ProfileSection(icon: "trash", text: "Delete Account")
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(Assets.iconWithoutBg)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 192, height: 192)
                    .clipShape(Circle())
                    .padding(.top, 20)
                Text("Melih Yaşar SÖZEN")
                    .font(.system(size: 24))
                    .fontWeight(.semibold)
                    .padding(.top, 16)
                Spacer()
                List {
                    NavigationLink(
                        destination: EditProfileScreen(
                            firstName: "Melih Yaşar",
                            lastName: "SÖZEN",
                            email: "mlhysrszn@gmail.com",
                            phoneNumber: "+905350786767",
                            city: "Edirne"
                        )
                    ) {
                        ProfileSectionButton(icon: "pencil", text: "Edit Profile")
                    }
                    NavigationLink(destination: ReservationsScreen()) {
                        ProfileSectionButton(icon: "list.bullet", text: "My Reservations")
                    }
                    ProfileSectionButton(icon: "lock.shield", text: "Privacy Policy")
                    ProfileSectionButton(icon: "doc.text", text: "Terms and Conditions")
                    ProfileSectionButton(icon: "star", text: "Rate Us")
                    ProfileSectionButton(icon: "trash", text: "Delete Account")
                }
                .scrollContentBackground(.hidden)
                .scrollDisabled(true)
                Spacer()
                PlainButton(label: "Logout", color: Color.red, isLoading: isLoading) {
                    Task {
                        do {
                            isLoading = true
                            try await authManager.signOut()
                        } catch {
                            print(error)
                        }
                        isLoading = false
                    }
                }
                .padding(.bottom, 24)
            }
            .padding()
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
