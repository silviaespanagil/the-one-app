//
//  ServerBaseResponse.swift
//  TheOneApp
//
//  Created by Silvia España on 25/11/21.
//

import Foundation

struct ServerBaseResponse<T: Codable>: Codable {
    
    let results: T
}
