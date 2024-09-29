//
//  OAuthTokenResponseBody.swift
//  ImageFeed
//
//  Created by Денис Филатов on 29.09.2024.
//
import Foundation

struct OAuthTokenResponseBody: Decodable {
    let accessToken: String

    private enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
    }
}
