//
//  CharacterRepositoryImplementation.swift
//  TheOneApp
//
//  Created by Silvia España on 26/11/21.
//

import Foundation
import Combine
import UIKit

class CharacterRepositoryImplementation: CharacterRepository {
    
    private let dataSource: CharacterDataSource
    
    init(dataSource: CharacterDataSource = CharacterDataSource()) {
        
        self.dataSource = dataSource
    }
    
    
    func getAllCharacters() -> AnyPublisher<[Character], Error> {
        
        return dataSource.getAllCharacters().map {
            
            serverCharacter -> [Character] in
            
            var characters: [Character] = []
            
            for serverCharacter in serverCharacter.results {
                
                let character = serverCharacter.convertToEntity()
                characters.append(character)
            }
            
            return characters
        }
        .mapError({ $0 })
        .eraseToAnyPublisher()
        
    }
}
