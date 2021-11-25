//
//  HTTPError.swift
//  TheOneApp
//
//  Created by Silvia España on 25/11/21.
//

import Foundation

enum HTTPError: LocalizedError, Equatable {
    
    case invalidResponse
    case invalidStatusCode
}
