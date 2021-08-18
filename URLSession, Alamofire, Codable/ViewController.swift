//
//  ViewController.swift
//  URLSession, Alamofire, Codable
//
//  Created by Sergey on 15.08.2021.
//

import UIKit

enum URLExamples: String {
    
    case imageURL = "https://applelives.com//wp-content/uploads/2016/03/iPhone-SE-11.jpeg"
    case exampleOne = "https://swiftbook.ru//wp-content/uploads/api/api_course"
    case exampleTwo = "https://swiftbook.ru//wp-content/uploads/api/api_courses"
    case exampleThree = "https://swiftbook.ru//wp-content/uploads/api/api_website_description"
    case exampleFour = "https://swiftbook.ru//wp-content/uploads/api/api_missing_or_wrong_fields"
    case exampleFive = "https://swiftbook.ru//wp-content/uploads/api/api_courses_capital"
    case postRequest = "https://jsonplaceholder.typicode.com/posts"// хранение данных на сервер // сервер сайта
}

   enum UserActions: String, CaseIterable {
    
    case dowloadImage = "Dowload Image"
    case exampleOne = "Example One"
    case exampleTwo = "Example Two"
    case exampleThree = "Example Three"
    case exampleFour = "Example Four"
    case ourCourses = "Our Courses"
    case postRequest = "POST Request"
    case alamofireGet = "Alamofire GET"
    case alamofirePost = "Alamofire POST"
                
    
}

//private let reuseIdentifier = "Cell"

class MainViewController: UICollectionViewController {
    
    let userActions = UserActions.allCases
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
  //      self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
 
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        userActions.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UserActionCell
        
        let userAction = userActions[indexPath.item]
        
        // достучаться до лайбла ячейки кастим до as! UserActionCell
        cell.userActionLabel.text = userAction.rawValue
        
        return cell
    }
    
  // считаем тапы по ячейкам CollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userAction = userActions[indexPath.item]
      //  print(userAction)
        //переходы по тапам
        // описываем действия каждой ячейки чеез switch переход
        switch userAction {
        
        case .dowloadImage: performSegue(withIdentifier: "showImage", sender: nil)
        case .exampleOne: exampleOneButtonPressed()
        case .exampleTwo: exampleTwoButtonPressed()
        case .exampleThree: exampleThreeButtonPressed()
        case .exampleFour: exampleFourButtonPressed()
        case .ourCourses: performSegue(withIdentifier: "showCourses", sender: nil)
            
        case .postRequest: postRequest()
         
        case .alamofireGet:
            break
        case .alamofirePost:
            break
        }
        
    }
    // подготовка экрана к переходу в таблицу
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCourses" {
            let coursesVC = segue.destination as! CoursesViewController
            coursesVC.fetchCourses()
        }
    }
    
    private func successAlert() {
        let alert = UIAlertController(title: "Success",
                                      message: "You can see the results in the Debug aria",
                                      preferredStyle: .alert)
        
        let okAlert = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAlert)
        present(alert, animated: true)
        
    }
    
    private func failedAlert() {
        let alert = UIAlertController(title: "Failed",
                                      message: "You can see the results in the Debug aria",
                                      preferredStyle: .alert)
        
        let okAlert = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAlert)
        present(alert, animated: true)
        
    }
    
}




extension MainViewController {
    
    private func exampleOneButtonPressed() {
        guard let url = URL(string: URLExamples.exampleOne.rawValue) else { return }
              
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
          //  if let error = error {
          //      print(error)
           //     return
          //  }
            
            guard let data = data else { return }
            
            
            // обработка джейсона на ошибку
            do {
                
                let course = try JSONDecoder().decode(Course.self, from: data)
                print(course)
                DispatchQueue.main.async {
                    self.successAlert()
                }
                
            } catch let error {
                print(error)
                DispatchQueue.main.async {
                    self.failedAlert()
                }
            }
            
    } .resume()
        
    }
    
    // массив джейсон
    private func exampleTwoButtonPressed() {
        guard let url = URL(string: URLExamples.exampleTwo.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
          //  if let error = error {
          //      print(error)
           //     return
          //  }
            
            guard let data = data else { return }
            
            
            // обработка джейсона на ошибку
            do {
                
                let courses = try JSONDecoder().decode([Course].self, from: data)
                print(courses)
                DispatchQueue.main.async {
                    self.successAlert()
                }
                
            } catch let error {
                print(error)
                DispatchQueue.main.async {
                    self.failedAlert()
                }
            }
            
    } .resume()
        
        
        
        
    }
    //новая модель с тремя типами//создаем данные для него
    private func exampleThreeButtonPressed() {
        guard let url = URL(string: URLExamples.exampleThree.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
          //  if let error = error {
          //      print(error)
           //     return
          //  }
            
            guard let data = data else { return }
            
            
            // обработка джейсона на ошибку
            do {
                
                let websiteDescription = try JSONDecoder().decode(WebsiteDescription.self, from: data)
                print(websiteDescription)
                DispatchQueue.main.async {
                    self.successAlert()
                }
                
            } catch let error {
                print(error)
                DispatchQueue.main.async {
                    self.failedAlert()
                }
            }
            
    } .resume()
        
    }
    //битый джейсон
    private func exampleFourButtonPressed() {
        guard let url = URL(string: URLExamples.exampleFour.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
          //  if let error = error {
          //      print(error)
           //     return
          //  }
            
            guard let data = data else { return }
            
            
            // обработка джейсона на ошибку
            do {
                
                let websiteDescription = try JSONDecoder().decode(WebsiteDescription.self, from: data)
                print(websiteDescription)
                DispatchQueue.main.async {
                    self.successAlert()
                }
                
            } catch let error {
                print(error)
                DispatchQueue.main.async {
                    self.failedAlert()
                }
            }
            
    } .resume()
        
        
        }
    
    private func postRequest() {
        guard let url = URL(string: URLExamples.postRequest.rawValue) else { return }
        let course = Course(
            name: "Networking",
            imageUrl: "https://swiftbook.ru/wp-content/uploads/sites/2/2018/08/notifications-course-with-background.png",
            numberOflessons: "67",
            numberOftests: "10"
        )
        guard  let courseData = try? JSONEncoder().encode(course) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = courseData
        
        
        // выполняем сам запрос
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let response = response, let data = data else { return }
            
            
            print(response)
            
            do {
                let course = try JSONDecoder().decode(Course.self, from: data)
                DispatchQueue.main.async {
                    self.successAlert()
                }
                print(course)
            } catch let error {
                print(error)
            }
            
            
        }.resume()
    }
}


// настройка ячейки в коде

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
    }
    
    
    
}
