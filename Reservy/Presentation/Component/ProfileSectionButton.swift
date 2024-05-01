//
//  ProfileSectionButton.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 30.04.2024.
//

import SwiftUI

struct ProfileSectionButton: View {
    var icon: String
    var text: String

    var body: some View {
        HStack {
            Image(systemName: icon)
            Text(text)
            Spacer()
        }
    }
}

#Preview {
    ProfileSectionButton(icon: "pencil", text: "Edit Profile")
}
