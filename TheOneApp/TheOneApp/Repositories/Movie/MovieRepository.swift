//
//  MovieRepository.swift
//  TheOneApp
//
//  Created by Silvia España on 16/12/21.
//

import Foundation
import Combine

protocol MovieRepository {
    
    func getAllMovies() -> AnyPublisher<[Movie], Error>
    
    func getMovieDetail(id: String) -> AnyPublisher<Movie, Error>
}
