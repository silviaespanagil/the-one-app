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
                         bookImage: "https://i1.wp.com/www.casualoptimist.com/wp-content/uploads/2020/09/fellowship-of-the-ring-illustration-johan-egerkrans.jpg?w=1650"))
        
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
