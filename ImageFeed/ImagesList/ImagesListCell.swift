//
//  ImagesListCell.swift
//  ImageFeed
//
//  Created by Денис Филатов on 31.08.2024.
//
import UIKit

final class ImagesListCell: UITableViewCell {
    
    @IBOutlet private var dateLabel: UILabel!
    
    @IBOutlet private var cellImage: UIImageView!
    
    @IBOutlet private var likeButton: UIButton!
    
    static let reuseIdentifier = "ImagesListCell"
    
    //Метод конфигруции ячейки
    func configure(with image: UIImage, date: Date, isLiked: Bool) {
        cellImage.image = image
        dateLabel.text = DateFormatter.localizedString(from: date, dateStyle: .medium, timeStyle: .none)
        
        let likeImage = isLiked ? UIImage(named: "Like_on") : UIImage(named: "Like_off")
        likeButton.setImage(likeImage, for: .normal)
    }
}


