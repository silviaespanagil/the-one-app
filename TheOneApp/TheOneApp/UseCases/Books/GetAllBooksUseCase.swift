//
//  GetAllBooksUseCASE.swift
//  TheOneApp
//
//  Created by Silvia España on 20/12/21.
//

import Foundation
import Combine

class GetAllBooksUseCase {
    
    private let repository: BookRepository
    
    init(repository: BookRepository = BookRepositoryImplementation()) {
        
        self.repository = repository
    }
    
    func execute() -> AnyPublisher<[Book], Error> {
        
        repository.getAllBooks()
    }
}
