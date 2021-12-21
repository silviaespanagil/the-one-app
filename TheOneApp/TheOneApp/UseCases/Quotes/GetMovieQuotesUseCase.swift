//
//  GetMovieQuotesUseCase.swift
//  TheOneApp
//
//  Created by Silvia España on 21/12/21.
//

import Foundation
import Combine

class GetMovieQuotesUseCase {
    
    private let repository: QuoteRepository
    
    init(repository: QuoteRepository = QuoteRepositoryImplementation()) {
        
        self.repository = repository
    }
    
    func execute(id: String) -> AnyPublisher<[Quote], Error> {
        
        repository.getMovieQuotes(id: id)
    }
}
