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
    var isGetBookChapterCalled = false
    
    func getAllBooks() -> AnyPublisher<[Book], Error> {
        
        self.isGetAllBooksCalled = true
        
        return Just([])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func getBookChapter(id: String) -> AnyPublisher<Book, Error> {
        
        self.isGetBookChapterCalled = true
        
        return Just(Book(id: "5cf5805fb53e011a64671582",
                          name: "The Fellowship Of The Ring",
                          chapterName: "A Long-expected Party"))
        
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
