//
//  ProfileScreen.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 30.04.2024.
//

import SwiftUI

struct ProfileScreen: View {
    var body: some View {
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
                ProfileSectionButton(icon: "pencil", text: "Edit Profile")
                ProfileSectionButton(icon: "list.bullet", text: "My Reservations")
                ProfileSectionButton(icon: "lock.shield", text: "Privacy Policy")
                ProfileSectionButton(icon: "doc.text", text: "Terms and Conditions")
                ProfileSectionButton(icon: "star", text: "Rate Us")
                ProfileSectionButton(icon: "trash", text: "Delete Account")
            }
            .scrollContentBackground(.hidden)
            .scrollDisabled(true)
            Spacer()
            PlainButton(label: "Logout", color: Color.red) {
                print("Logout clicked")
            }
            .padding(.bottom, 24)
        }
        .padding()
    }
}

#Preview {
    ProfileScreen()
}
