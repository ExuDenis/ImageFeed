//
//  ViewController.swift
//  ImageFeed
//
//  Created by Денис Филатов on 29.08.2024.
//

import UIKit

final class ImagesListViewController: UIViewController {
    
    private let showSingleImageSegueIdentifier = "ShowSingleImage"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == showSingleImageSegueIdentifier { // 1
            guard
                let viewController = segue.destination as? SingleImageViewController, // 2
                let indexPath = sender as? IndexPath // 3
            else {
                assertionFailure("Invalid segue destination") // 4
                return
            }
            
            let image = UIImage(named: photosName[indexPath.row]) // 5
            viewController.image = image // 6
        } else {
            super.prepare(for: segue, sender: sender) // 7
        }
    }
    
    @IBOutlet private var tableView: UITableView!
    
    //Содержит строки, представляющие названия изображений
    private let photosName: [String] = Array(0..<20).map{ "\($0)"}
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 200
        tableView.contentInset = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
    }
}

//Отвечает за предоставление данных для таблицы
extension ImagesListViewController: UITableViewDataSource {
    //Возвращает количество строк
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photosName.count
    }
    
    //Настраивает и возвращает ячейку для каждой строки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ImagesListCell.reuseIdentifier, for: indexPath)
        
        guard let imageListCell = cell as? ImagesListCell else {
            return UITableViewCell()
        }
        
        imageListCell.selectionStyle = .none
        //Метод вызова
        configCell(for: imageListCell, with: indexPath)
        return imageListCell
    }
}

extension ImagesListViewController {
    //Настраивает содержимое ячейки: устанавливает изображение, дату и состояние кнопки "лайк".
    func configCell(for cell: ImagesListCell, with indexPath: IndexPath) {
        guard let image = UIImage(named: photosName[indexPath.row]) else {
            return
        }
        
        let isLiked = indexPath.row % 2 == 0
        cell.configure(with: image, date: Date(), isLiked: isLiked)
    }
}

//Отвечает за поведение таблицы
extension ImagesListViewController: UITableViewDelegate {
    //Обрабатывает выбор строки
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //Осуществление перехода при нажатии на картинку
        performSegue(withIdentifier: showSingleImageSegueIdentifier, sender: indexPath)
    }
    
    //Динамически вычисляет высоту строки на основе размеров изображения и отступов.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let image = UIImage(named: photosName[indexPath.row]) else {
            return 0
        }
        
        let imageInsets = UIEdgeInsets(top: 4, left: 16, bottom: 4, right: 16)
        let imageViewWidth = tableView.bounds.width - imageInsets.left - imageInsets.right
        let imageWidth = image.size.width
        
        //Проверка деления на 0
        guard imageWidth != 0 else {
            return 0
        }
        
        let scale = imageViewWidth / imageWidth
        let cellHeight = image.size.height * scale + imageInsets.top + imageInsets.bottom
        return cellHeight
    }
}




