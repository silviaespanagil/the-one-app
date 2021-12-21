//
//  QuoteRepository.swift
//  TheOneApp
//
//  Created by Silvia España on 21/12/21.
//

import Foundation
import Combine

protocol QuoteRepository {
    
    func getAllQuotes() -> AnyPublisher<[Quote], Error>
    
    func getCharacterQuotes(id: String) -> AnyPublisher<[Quote], Error>
    
    func getMovieQuotes(id: String) -> AnyPublisher<[Quote], Error>
}
