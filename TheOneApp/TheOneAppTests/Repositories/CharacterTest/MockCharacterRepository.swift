//
//  MockCharacterRepository.swift
//  TheOneAppTests
//
//  Created by Silvia España on 10/12/21.
//

import XCTest
import XCTest
import Combine
@testable import TheOneApp

class MockCharacterRepository: CharacterRepository {
    
    var isGetAllCharactersCalled = false
    
    func getAllCharacters(page: Int) -> AnyPublisher<[Character], Error> {
        
        self.isGetAllCharactersCalled = true
        
        return Just([])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
}

