//
//  MockMovieRepository.swift
//  TheOneAppTests
//
//  Created by Silvia España on 16/12/21.
//

import XCTest
import Combine
@testable import TheOneApp

class MockMovieRepository: MovieRepository {
    
    var isGetAllMoviesCalled = false
    var isGetMovieDetailCalled = false
    
    func getAllMovies() -> AnyPublisher<[Movie], Error> {
        
        self.isGetAllMoviesCalled = true
        
        return Just([])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func getMovieDetail(id: String) -> AnyPublisher<Movie, Error> {
        
        self.isGetMovieDetailCalled = true
        
        return Just(Movie(id: "5cd95395de30eff6ebccde56",
                          name: "The Lord of the Rings Series",
                          runtime: 558,
                          budget: 281,
                          revenue: 2917,
                          oscarNominations: 30,
                          oscarWins: 17,
                          rottenTomatoesScore: 94,
                          movieImage: "",
                          releaseDate: 0))
            
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
