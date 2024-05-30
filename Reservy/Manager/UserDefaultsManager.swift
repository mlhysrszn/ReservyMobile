//
//  UserDefaultsManager.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 28.05.2024.
//

import Foundation

public class UserDefaultsManager: ObservableObject {
    public static let shared = UserDefaultsManager()
    
    private let userDefaults: UserDefaults
    
    private init() {
        self.userDefaults = UserDefaults.standard
        self.isUserLoggedIn = userDefaults.bool(forKey: UserDefaultKeys.isLoggedIn)
    }
    
    @Published var isUserLoggedIn: Bool {
        didSet {
            userDefaults.setValue(isUserLoggedIn, forKey: UserDefaultKeys.isLoggedIn)
        }
    }
}
