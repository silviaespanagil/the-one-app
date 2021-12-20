//
//  MockChapterRepository.swift
//  TheOneAppTests
//
//  Created by Silvia España on 20/12/21.
//

import XCTest
import Combine
@testable import TheOneApp

class MockChapterRepository: ChapterRepository {

    var isGetChapterByBookCalled = false
    
    func getChaptersByBookId(id: String) -> AnyPublisher<[Chapter], Error> {
        
        self.isGetChapterByBookCalled = true
        
        return Just([])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
