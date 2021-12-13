//
//  Character.swift
//  TheOneApp
//
//  Created by Silvia España on 25/11/21.
//

import Foundation

struct Character: Identifiable, Equatable {
    
    let id: String
    let height: String?
    let race: Race?
    let gender: String?
    let birth: String?
    let spouse: String?
    let death: String?
    let realm: String?
    let hair: String?
    let name: String
    let wikiURL: String?
    
    func getRace() -> String {
        
        return race?.description ?? ""
    }

}
