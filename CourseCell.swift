//
//  CourseCell.swift
//  URLSession, Alamofire, Codable
//
//  Created by Sergey on 17.08.2021.
//

import UIKit

class CourseCell: UITableViewCell {

  
    @IBOutlet var courseImage: UIImageView!
    @IBOutlet var courseNameLabel: UILabel!
    @IBOutlet var numberOfLesson: UILabel!
    @IBOutlet var numberOfTest: UILabel!
    
    // создаем публичный метод для передачи оутлетов
     func configure(with course: Course) {
        courseNameLabel.text = course.name
  //      numberOfLesson.text = "Number of lessons: \(course.numberOflessons ?? 0)"
   //     numberOfTest.text = "Number of lessons: \(course.numberOftests ?? 0)"
        
        numberOfLesson.text = "Number of lessons: \(course.numberOflessons ?? "0")"// post string type
        numberOfTest.text = "Number of lessons: \(course.numberOftests ?? "0")"
        
        
        // загрузка картинки одной строкой
        DispatchQueue.global().async {
            guard let stringURL = course.imageUrl else { return }// извлекаем строку URL адрес
            guard let imageURL = URL(string: stringURL) else { return }
            guard let imageData = try? Data(contentsOf: imageURL) else { return }// сетевой запрос уходим с этой строки в фоновый режим
            
            DispatchQueue.main.async {
                self.courseImage.image = UIImage(data: imageData)
            }
            
        }
       
    }
    
}




