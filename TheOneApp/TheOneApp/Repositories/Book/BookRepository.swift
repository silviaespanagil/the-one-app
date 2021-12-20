//
//  BookRepository.swift
//  TheOneApp
//
//  Created by Silvia España on 20/12/21.
//

import Foundation
import Combine

protocol BookRepository {
    
    func getAllBooks() -> AnyPublisher<[Book], Error>
    
    func getBookChapter(id: String) -> AnyPublisher<Book, Error>
}
