//
//  ImagesListCell.swift
//  ImageFeed
//
//  Created by Денис Филатов on 31.08.2024.
//

import Foundation
import UIKit

final class ImagesListCell: UITableViewCell {
    
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var cellImage: UIImageView!
    
    @IBOutlet var likeButton: UIButton!
    
    static let reuseIdentifier = "ImagesListCell"
}
