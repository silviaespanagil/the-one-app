//
//  GetAllMoviesUseCase.swift
//  TheOneApp
//
//  Created by Silvia España on 16/12/21.
//

import Foundation
import Combine

class GetAllMoviesUseCase {
    
    private let repository: MovieRepository
    
    init(repository: MovieRepository = MovieRepositoryImplementation()) {
        
        self.repository = repository
    }
    
    func execute() -> AnyPublisher<[Movie], Error> {
        
        repository.getAllMovies()
    }
}
