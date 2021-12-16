//
//  GetMovieDetailUseCase.swift
//  TheOneApp
//
//  Created by Silvia España on 16/12/21.
//

import Foundation
import Combine

class GetMovieDetailUseCase {
    
    private let repository: MovieRepository
    
    init(repository: MovieRepository = MovieRepositoryImplementation()) {
        
        self.repository = repository
    }
    
    func execute(id: String) -> AnyPublisher<Movie, Error> {
        
        repository.getMovieDetail(id: id)
    }
}
