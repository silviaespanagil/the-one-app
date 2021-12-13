//
//  GetCharacterDetailUseCase.swift
//  TheOneApp
//
//  Created by Silvia España on 13/12/21.
//

import Foundation
import Combine

class GetCharacterDetailUseCase {
    
    private let repository: CharacterRepository
    
    init(repository: CharacterRepository = CharacterRepositoryImplementation()) {
        
        self.repository = repository
    }
    
    func execute(id: String) -> AnyPublisher<Character, Error> {
        
        repository.getCharacterDetail(id: id)
    }
}
