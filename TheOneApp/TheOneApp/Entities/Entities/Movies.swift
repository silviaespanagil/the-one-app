//
//  Movies.swift
//  TheOneApp
//
//  Created by Silvia España on 15/12/21.
//

import Foundation

struct Movie: Identifiable, Equatable {

    let id: String
    let name: String
    let runtime: Int
    let budget: Int
    let revenue: Double
    let oscarNominations: Int
    let oscarWins: Int
    let rottenTomatoesScore: Double
    let movieImage: String
    let releaseDate: Int
}
