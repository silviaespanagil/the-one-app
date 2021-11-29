//
//  ServerCharacterResponse.swift
//  TheOneApp
//
//  Created by Silvia España on 25/11/21.
//

import Foundation

struct ServerCharacterResponse: Codable {

    let _id: String
    let height: String?
    let race: String?
    let gender: String?
    let birth: String?
    let spouse: String?
    let death: String?
    let realm: String?
    let hair: String?
    let name: String
    let wikiURL: String
    func convertToEntity() -> Character {
        
        return Character(id: _id,
                         height: height ?? "",
                         race: race ?? "",
                         gender: gender ?? "",
                         birth: birth ?? "",
                         spouse: spouse ?? "",
                         death: death ?? "",
                         realm: realm ?? "",
                         hair: hair ?? "",
                         name: name,
                         wikiURL: wikiURL)
        
        
    }
}

