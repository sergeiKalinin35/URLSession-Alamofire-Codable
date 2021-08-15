//
//  ImageViewController.swift
//  URLSession, Alamofire, Codable
//
//  Created by Sergey on 15.08.2021.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

      //ромашка
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
    }
    
// метод fetch загрузка
    
    private func fetchImage() {
        
        // сетевой запрос нужен URL адресс step 1
        guard let url = URL(string: URLExamples.imageURL.rawValue) else { return }// опциональный URL через гард
        // взяли URL
        
        // сетевые запросы
        URLSession.shared.dataTask(with: url) { (data, _, error) in
          if let error = error {
                print(error)
                return
            }
            
            if let data = data, let image = UIImage(data: data) {
                self.imageView.image = image
                print(data)
                return
            }
            
            
            
        }.resume() // запуск задачи
        // completionHandler ответ от сервера
        
        
        
        
    }

}
