//
//  TermsAndConditionsScreen.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 3.06.2024.
//

import SwiftUI

struct TermsAndConditionsScreen: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Terms and Conditions")
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("1. Introduction")
                        .font(.headline)
                    Text("""
                    Welcome to our application. These terms and conditions outline the rules and regulations for the use of our application.
                    By accessing this application we assume you accept these terms and conditions. Do not continue to use our application if you do not agree to take all of the terms and conditions stated on this page.
                    The following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice and all Agreements: "Client", "You" and "Your" refers to you, the person log on this application and compliant to the Company's terms and conditions. "The Company", "Ourselves", "We", "Our" and "Us", refers to our Company. "Party", "Parties", or "Us", refers to both the Client and ourselves. All terms refer to the offer, acceptance and consideration of payment necessary to undertake the process of our assistance to the Client in the most appropriate manner for the express purpose of meeting the Client's needs in respect of provision of the Company's stated services, in accordance with and subject to, prevailing law of Netherlands. Any use of the above terminology or other words in the singular, plural, capitalization and/or he/she or they, are taken as interchangeable and therefore as referring to same.
                    """)
                    
                    Text("2. License")
                        .font(.headline)
                    Text("""
                    Unless otherwise stated, our Company and/or its licensors own the intellectual property rights for all material on our application. All intellectual property rights are reserved. You may access this from our application for your own personal use subjected to restrictions set in these terms and conditions.
                    You must not:
                    - Republish material from our application
                    - Sell, rent or sub-license material from our application
                    - Reproduce, duplicate or copy material from our application
                    - Redistribute content from our application
                    This Agreement shall begin on the date hereof.
                    """)
                }
                .padding(.horizontal)
            }
            .padding()
        }
        .navigationTitle("Terms and Conditions")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    TermsAndConditionsScreen()
}
