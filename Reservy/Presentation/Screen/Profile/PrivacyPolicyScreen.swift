//
//  PrivacyPolicyScreen.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 3.06.2024.
//

import SwiftUI

struct PrivacyPolicyScreen: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Privacy Policy")
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("1. Introduction")
                        .font(.headline)
                    Text("""
                    Welcome to our application. This Privacy Policy governs the manner in which our application collects, uses, maintains and discloses information collected from users (each, a "User").
                    """)
                    
                    Text("2. Personal identification information")
                        .font(.headline)
                    Text("""
                    We may collect personal identification information from Users in a variety of ways, including, but not limited to, when Users visit our application, register on the application, and in connection with other activities, services, features or resources we make available on our application. Users may be asked for, as appropriate, name, email address, phone number. Users may, however, visit our application anonymously. We will collect personal identification information from Users only if they voluntarily submit such information to us. Users can always refuse to supply personally identification information, except that it may prevent them from engaging in certain application related activities.
                    """)
                    
                    // Add more sections as needed...
                }
                .padding(.horizontal)
            }
            .padding()
        }
        .navigationTitle("Privacy Policy")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PrivacyPolicyScreen()
}
