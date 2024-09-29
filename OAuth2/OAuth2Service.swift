//
//  Auoth2.swift
//  ImageFeed
//
//  Created by Денис Филатов on 29.09.2024.
//

import Foundation

class OAuth2Service {
    private let session = URLSession.shared
    
    func fetchOAuthToken(code: String, completion: @escaping (Result<String, Error>) -> Void) {
        let request = makeOAuthTokenRequest(code: code)
        let task = session.data(for: request) { result in
            switch result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(OAuthTokenResponseBody.self, from: data)
                    completion(.success(response.accessToken))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    private func makeOAuthTokenRequest(code: String) -> URLRequest {
        var urlComponents = URLComponents(string: "https://unsplash.com/oauth/token")!
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: Constants.AccessKey),
            URLQueryItem(name: "client_secret", value: Constants.SecretKey),
            URLQueryItem(name: "redirect_uri", value: Constants.RedirectURI),
            URLQueryItem(name: "code", value: code),
            URLQueryItem(name: "grant_type", value: "authorization_code")
        ]
        
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "POST"
        return request
    }
}
