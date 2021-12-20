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
    let chapterName: String?
    
    func convertToEntity() -> Book {
        
        return Book(id: _id,
                    name: name,
                    chapterName: chapterName ?? "")
    }
}
