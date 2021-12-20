//
//  BookrRepositoryImplementation.swift
//  TheOneApp
//
//  Created by Silvia España on 20/12/21.
//

import Foundation
import Combine

class BookRepositoryImplementation: BookRepository {
    
    private let dataSource: BookDataSource
    
    init(dataSource: BookDataSource = BookDataSource()) {
        
        self.dataSource = dataSource
    }
    
    func getAllBooks() -> AnyPublisher<[Book], Error> {
        
        return dataSource.getAllBooks().map { serverBook -> [Book] in
            
            var books: [Book] = []
            
            for serverBook in serverBook.docs {
                
                let book = serverBook.convertToEntity()
                
                books.append(book)
            }
            
            return books
        }
        .mapError({ $0 })
        .eraseToAnyPublisher()
    }
}
