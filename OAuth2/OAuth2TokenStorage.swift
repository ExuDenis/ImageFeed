//
//  OAuth2TokenStorage.swift
//  ImageFeed
//
//  Created by Денис Филатов on 29.09.2024.
//

import Foundation

final class OAuth2TokenStorage {
    var token: String? {
        get {
            storage.string(forKey: Keys.token.rawValue)
        }
        set {
            storage.set(newValue, forKey: Keys.token.rawValue)
        }
    }
    private let storage: UserDefaults = .standard
    
    private enum Keys: String {
        case token
    }
}
