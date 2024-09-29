//
//  AuthViewController.swift
//  ImageFeed
//
//  Created by Денис Филатов on 21.09.2024.
//

import UIKit

final class AuthViewController: UIViewController {
    private let showWebViewSegueIdentifier = "ShowWebView"
    private let oauth2Service = OAuth2Service()

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == showWebViewSegueIdentifier {
            guard
                let webViewViewController = segue.destination as? WebViewViewController
            else { fatalError("Failed to prepare for \(showWebViewSegueIdentifier)") }
            webViewViewController.delegate = self
        } else {
            super.prepare(for: segue, sender: sender)
        }
    }
}

extension AuthViewController: WebViewViewControllerDelegate {
    func webViewViewController(_ vc: WebViewViewController, didAuthenticateWithCode code: String) {
        oauth2Service.fetchOAuthToken(code: code) { [weak self] result in
            switch result {
            case .success(let token):
                print("Token received: \(token)")
                // Здесь можно выполнить переход на следующий экран
                self?.showMainScreen()
            case .failure(let error):
                print("Failed to receive token: \(error)")
                // Здесь можно показать пользователю сообщение об ошибке
                self?.showErrorAlert(message: error.localizedDescription)
            }
        }
    }

    func webViewViewControllerDidCancel(_ vc: WebViewViewController) {
        dismiss(animated: true)
    }
    
    private func showMainScreen() {
        // Здесь можно выполнить переход на главный экран приложения
        let mainViewController = ImagesListViewController()
        navigationController?.pushViewController(mainViewController, animated: true)
    }
    
    private func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
