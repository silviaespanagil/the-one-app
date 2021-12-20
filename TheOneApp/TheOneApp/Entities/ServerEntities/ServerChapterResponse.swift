//
//  ServerChapterResponse.swift
//  TheOneApp
//
//  Created by Silvia España on 20/12/21.
//

import Foundation

struct ServerChapterResponse: Codable {
    
    let _id: String
    let chapterName: String
    
    func convertToEntity() -> Chapter {
        
        return Chapter(id: _id,
                       chapterName: chapterName)
    }
}
