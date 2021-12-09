//
//  ServerBaseArrayReponse.swift
//  TheOneApp
//
//  Created by Silvia España on 25/11/21.
//

import Foundation

struct ServerBaseArrayResponse<T: Codable>: Codable {
    
    let docs: [T]
}

