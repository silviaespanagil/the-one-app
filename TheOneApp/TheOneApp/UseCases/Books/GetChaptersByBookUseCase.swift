//
//  GetBookChaptersUseCase.swift
//  TheOneApp
//
//  Created by Silvia España on 20/12/21.
//

import Foundation
import Combine

class GetChaptersByBookUseCase {
    
    private let repository: ChapterRepository
    
    init(repository: ChapterRepository = ChapterRepositoryImplementation()) {
        
        self.repository = repository
    }
    
    func execute(id: String) -> AnyPublisher<[Chapter], Error> {
        
        repository.getChaptersByBookId(id: id)
    }
}
