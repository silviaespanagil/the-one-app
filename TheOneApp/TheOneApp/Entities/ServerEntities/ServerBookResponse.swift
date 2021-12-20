//
//  ServerBookResponse.swift
//  TheOneApp
//
//  Created by Silvia España on 20/12/21.
//

import Foundation

struct ServerBookResponse: Codable {
    
    let _id: String
    let name: String
    let bookImage: String?
    
    func convertToEntity() -> Book {
        
        return Book(id: _id,
                    name: name,
                    bookImage: getBookImage())
    }
    
    func getBookImage() -> String {
        
        if name.contains("Fellowship") {
            
            return "https://i1.wp.com/www.casualoptimist.com/wp-content/uploads/2020/09/fellowship-of-the-ring-illustration-johan-egerkrans.jpg?w=1650"
        } else if name.contains("Towers"){
            
            return "https://i1.wp.com/www.casualoptimist.com/wp-content/uploads/2020/09/two-towers-illustration-johan-egerkrans.jpg?w=1650"
        } else {
            
            return "https://i2.wp.com/www.casualoptimist.com/wp-content/uploads/2020/09/return-of-the-king-illustration-johan-egerkrans.jpg?w=1650"
        }
    }
}
