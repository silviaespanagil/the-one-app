//
//  GetAllCharactersUseCase.swift
//  TheOneApp
//
//  Created by Silvia España on 26/11/21.
//

import Foundation
import Combine

class GetAllCharactersUseCase {
    
    private let repository: CharacterRepository
    
    init(repository: CharacterRepository = CharacterRepositoryImplementation()) {
        
        self.repository = repository
    }
    
    func execute() -> AnyPublisher<[Character], Error> {
        
        repository.getAllCharacters()
    }
}
