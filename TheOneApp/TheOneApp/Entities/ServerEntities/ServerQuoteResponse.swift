//
//  ServerQuoteResponse.swift
//  TheOneApp
//
//  Created by Silvia España on 21/12/21.
//

import Foundation

struct ServerQuoteResponse: Codable {
    
    let _id: String
    let dialog: String
    let movie: String
    let character: String
    
    func convertToEntity() -> Quote {
        
        return Quote(id: _id,
                     dialog: dialog,
                     movie: movie,
                     character: character)
    }
}
