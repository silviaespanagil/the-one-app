//
//  GetBookChaptersUseCase.swift
//  TheOneApp
//
//  Created by Silvia España on 20/12/21.
//

import Foundation
import Combine

class GetBookChaptersUseCase {
    
    private let repository: BookRepository
    
    init(repository: BookRepository = BookRepositoryImplementation()) {
        
        self.repository = repository
    }
    
    func execute(id: String) -> AnyPublisher<Book, Error> {
        
        repository.getBookChapter(id: id)
    }
}
