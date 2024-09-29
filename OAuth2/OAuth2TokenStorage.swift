//
//  OAuth2TokenStorage.swift
//  ImageFeed
//
//  Created by Денис Филатов on 29.09.2024.
//

import Foundation

import Foundation

class OAuth2TokenStorage {
    private enum Keys: String {
        case token
    }
    
    var token: String? {
        get {
            return UserDefaults.standard.string(forKey: Keys.token.rawValue)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.token.rawValue)
        }
    }
}
