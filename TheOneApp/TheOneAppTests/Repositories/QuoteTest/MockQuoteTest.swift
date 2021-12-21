//
//  MockQuoteTest.swift
//  TheOneAppTests
//
//  Created by Silvia España on 21/12/21.
//

import XCTest
import Combine
@testable import TheOneApp

class MockQuoteRepository: QuoteRepository {

    var isGetAllQuotesCalled = false
    var isGetCharacterQuoteCalled = false
    var isGetMovieQuoteCalled = false
    
    func getAllQuotes() -> AnyPublisher<[Quote], Error> {
        
        self.isGetAllQuotesCalled = true
        
        return Just([])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func getCharacterQuotes(id: String) -> AnyPublisher<[Quote], Error> {
        
        self.isGetCharacterQuoteCalled = true
        
        return Just([])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func getMovieQuotes(id: String) -> AnyPublisher<[Quote], Error> {
        
        self.isGetMovieQuoteCalled = true
        
        return Just([])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
