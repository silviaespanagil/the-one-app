//
//  MovieRepositoryImplementation.swift
//  TheOneApp
//
//  Created by Silvia España on 16/12/21.
//

import Foundation
import Combine

class MovieRepositoryImplementation: MovieRepository {

    private let dataSource: MovieDataSource
    
    init(dataSource: MovieDataSource = MovieDataSource()) {
        
        self.dataSource = dataSource
    }
    
    func getAllMovies() -> AnyPublisher<[Movie], Error> {
        
        return dataSource.getAllMovies().map { serverMovie -> [Movie] in
            
            var movies: [Movie] = []
            
            for serverMovie in serverMovie.docs {
                
                let movie = serverMovie.convertToEntity()
                
                movies.append(movie)
            }
            
            return movies
        }
        .mapError({ $0 })
        .eraseToAnyPublisher()
    }
    
    func getMovieDetail(id: String) -> AnyPublisher<Movie, Error> {
        
        return dataSource.getMovieDetail(id: id).map { serverMovie -> Movie in
            
            let movie = serverMovie.convertToEntity()
            
            return movie
        }
        .mapError({ $0 })
        .eraseToAnyPublisher()
        
    }
}
