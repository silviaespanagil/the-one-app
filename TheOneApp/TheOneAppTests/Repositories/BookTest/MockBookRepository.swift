//
//  MockBookRepository.swift
//  TheOneAppTests
//
//  Created by Silvia España on 20/12/21.
//

import XCTest
import Combine
@testable import TheOneApp

class MockBookRepository: BookRepository {
    
    var isGetAllBooksCalled = false
    
    func getAllBooks() -> AnyPublisher<[Book], Error> {
        
        self.isGetAllBooksCalled = true
        
        return Just([])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
