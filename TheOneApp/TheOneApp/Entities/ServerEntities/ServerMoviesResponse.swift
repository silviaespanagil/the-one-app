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
    let boxOfficeRevenueInMillions: Double
    let academyAwardNominations: Int
    let academyAwardWins: Int
    let rottenTomatoesScore: Double
    let movieImage: String?
    let releaseDate: Int?
    
    func convertToEntity() -> Movie {
        
        return Movie(id: _id,
                     name: editMovieName(),
                     runtime: runtimeInMinutes,
                     budget: budgetInMillions,
                     revenue: boxOfficeRevenueInMillions,
                     oscarNominations: academyAwardNominations,
                     oscarWins: academyAwardWins,
                     rottenTomatoesScore: rottenTomatoesScore,
                     movieImage: getMovieImage(),
                     releaseDate: getReleaseDate()
        )
    }
    
    func getMovieImage() -> String {
        
        if name.contains("Fellowship") {
            return "https://images.mubicdn.net/images/film/1754/cache-47885-1563055256/image-w1280.jpg"
        } else if name.contains("Towers") {
            
            return "https://justkillingti.me/wp-content/2017/10/maxresdefault8.jpg"
        } else if name.contains("Return") {
            
            return "http://content7.flixster.com/site/10/26/88/10268849_ori.jpg"
        } else if name.contains ("Journey") {
            
            return "https://images.squarespace-cdn.com/content/v1/52d6d1ede4b0b322e9c7a2ea/1417713604530-H8N52RZQMPUGP48EU5ZF/image-asset.jpeg"
        } else if name.contains ("Desolation") {
            
            return "https://static.wikia.nocookie.net/pjmidearthfilms/images/2/2d/Wp1861652.jpg/revision/latest?cb=20210324195413"
        } else if name.contains ("Battle") {
            
            return "https://www.tolkiensociety.org/app/uploads/2014/12/AzogArmy-840x352.jpg"
        } else {
            
            return "https://images.squarespace-cdn.com/content/v1/52d6d1ede4b0b322e9c7a2ea/1417713604530-H8N52RZQMPUGP48EU5ZF/image-asset.jpeg"
        }
    }
    
    func getReleaseDate() -> Int {
        
        if name.contains("Fellowship") {
            return 2001
        } else if name.contains("Towers") {
            
            return 2002
        } else if name.contains("Return") {
            
            return 2003
        } else if name.contains ("Journey") {
            
            return 2012
        } else if name.contains ("Desolation") {
            
            return 2013
        } else if name.contains ("Battle") {
            
            return 2014
        } else {
            
            return 0
        }
    }
    
    func editMovieName() -> String {
        
        if name.contains("Journey") {
            return "An Unexpected Journey"
        } else {
            
            return name
        }
    }
    
}
