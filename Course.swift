//
//  Course.swift
//  URLSession, Alamofire, Codable
//
//  Created by Sergey on 16.08.2021.
//



struct Course: Codable {
    
    let name               : String?
    let imageUrl           : String?
    let numberOflessons  : String?
    let numberOftests    : String?
    // POST сервер всегда STRING не INT и тд
    


}


struct WebsiteDescription: Decodable {
    let courses: [Course]?
    let websiteDescription: String?
    let websiteName: String?
}



/*
struct Course: Decodable {
    
    let name               : String?
    let imageUrl           : String?
    let numberOflessons  : Int?
    let numberOftests    : Int?
    
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case imageUrl = "ImageUrl"
        case numberOflessons = "Number_of_lesons"
        case numberOftests = "Number_of_tests"
        
        
    }
    
    
}
*/




















