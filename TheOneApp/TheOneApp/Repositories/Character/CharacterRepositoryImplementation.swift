//
//  CharacterRepositoryImplementation.swift
//  TheOneApp
//
//  Created by Silvia España on 26/11/21.
//

import Foundation
import Combine

class CharacterRepositoryImplementation: CharacterRepository {
    
    private let dataSource: CharacterDataSource
    
    init(dataSource: CharacterDataSource = CharacterDataSource()) {
        
        self.dataSource = dataSource
    }
    
    
    func getAllCharacters(page: Int) -> AnyPublisher<[Character], Error> {
        
        return dataSource.getAllCharacters(page: page).map {
            
            serverCharacter -> [Character] in
            
            var characters: [Character] = []
            
            for serverCharacter in serverCharacter.docs {
                
                let character = serverCharacter.convertToEntity()
                characters.append(character)
            }
            
            return characters
        }
        .mapError({ $0 })
        .eraseToAnyPublisher()
        
    }
}
