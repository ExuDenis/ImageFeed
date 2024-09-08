//
//  ProfileViewController.swift
//  ImageFeed
//
//  Created by Денис Филатов on 02.09.2024.
//
import UIKit

final class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let avatarImageView = UIImage(named: "Image")
        let imageView = UIImageView(image: avatarImageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        //Положение
        imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        
        //Размер
        imageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1.0).isActive = true
        
        let nameLabel = UILabel()
        nameLabel.text = "Екатерина Новикова"
        nameLabel.font = UIFont.systemFont(ofSize: 23)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        //Положение
        nameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 16).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
        
        let loginNameLabel = UILabel()
        loginNameLabel.text = "@ekaterina_nov"
        loginNameLabel.font = UIFont.systemFont(ofSize: 13)
        loginNameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginNameLabel)
        
        //Положение
        loginNameLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor).isActive = true
        loginNameLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        loginNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8).isActive = true
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Hello, world!"
        descriptionLabel.font = UIFont.systemFont(ofSize: 13)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabel)
        
        //Положение
        descriptionLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: loginNameLabel.bottomAnchor, constant: 8).isActive = true
        
        let LogoutButton = UIButton.systemButton(
            with: UIImage(named: "Exit")!,
            target: self,
            action: #selector(Self.didTapLogoutButton)
        )
        LogoutButton.tintColor = .red
        LogoutButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(LogoutButton)
        
        //Положение
        LogoutButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        LogoutButton.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        
        //Размер
        LogoutButton.widthAnchor.constraint(equalToConstant: 44).isActive = true
        LogoutButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    @objc
    private func didTapLogoutButton() {}
}
