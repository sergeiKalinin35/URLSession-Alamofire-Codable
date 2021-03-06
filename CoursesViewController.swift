//
//  CoursesViewController.swift
//  URLSession, Alamofire, Codable
//
//  Created by Sergey on 17.08.2021.
//

import UIKit
import Alamofire

class CoursesViewController: UITableViewController {
    
    var courses: [Course] = []
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 180
        
       
    }

    // MARK: - Table view data source

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        courses.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CourseCell
        
        let course = courses[indexPath.row]
        
        cell.configure(with: course)
        

        return cell
    }
    

   }

// NETWORKING
extension CoursesViewController {
    func fetchCourses() {
      //  guard let url = URL(string: URLExamples.exampleTwo.rawValue) else { return }
        guard let url = URL(string: URLExamples.exampleFive.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
        
            
            guard let data = data else { return }
            
            
            // обработка джейсона на ошибку
            do {
                let decoder = JSONDecoder()
            //    decoder.keyDecodingStrategy = .convertFromSnakeCase
                self.courses = try decoder.decode([Course].self, from: data)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()//перезагружает методы протокола
                }
                
            } catch let error {
                print(error)
              
            }
            
    } .resume()
        
    }
    
    func alamofireGetButtonPressed() {
        
        AF.request(URLExamples.exampleTwo.rawValue)
       //  ручной метод парсить джейсон
            .responseJSON { dataResponse in
            guard let statusCode = dataResponse.response?.statusCode else { return }
     
               print("STATUS CODE: \(statusCode)")
            }
        
        
        
        
        
        
    }
    
    
    
 func  alamofirePostButtonPresssed() {
        
    }
    
    
    
    
    
    
}
