//
//  ServerMoviesResponse.swift
//  TheOneApp
//
//  Created by Silvia España on 15/12/21.
//

import Foundation
import SwiftUI

struct ServerMoviesResponse: Codable {
    
    let _id: String
    let name: String
    let runtimeInMinutes: Int
    let budgetInMillions: Int
    let boxOfficeRevenueInMillions: Int
    let academyAwardNominations: Int
    let academyAwardWins: Int
    let rottenTomatoesScore: Int
    
    func convertToEntity() -> Movie {
        
        return Movie(id: _id,
                     name: name,
                     runtime: runtimeInMinutes,
                     budget: budgetInMillions,
                     revenue: boxOfficeRevenueInMillions,
                     oscarNominations: academyAwardNominations,
                     oscarWins: academyAwardWins,
                     rottenTomatoesScore: rottenTomatoesScore)
    }
}
