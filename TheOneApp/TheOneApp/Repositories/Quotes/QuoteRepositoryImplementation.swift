//
//  QuoteRepositoryImplementation.swift
//  TheOneApp
//
//  Created by Silvia España on 21/12/21.
//

import Foundation
import Combine

class QuoteRepositoryImplementation: QuoteRepository {
   
    private let dataSource: QuoteDataSource
    
    init(dataSource: QuoteDataSource = QuoteDataSource()) {
        
        self.dataSource = dataSource
    }
    
    func getAllQuotes() -> AnyPublisher<[Quote], Error> {
        
        return dataSource.getAllQuotes().map { serverQuote -> [Quote] in
            
            var quotes: [Quote] = []
            
            for serverQuote in serverQuote.docs {
                
                let quote = serverQuote.convertToEntity()
                
                quotes.append(quote)
            }
            
            return quotes
        }
        .mapError({ $0 })
        .eraseToAnyPublisher()
    }
    
    func getCharacterQuotes(id: String) -> AnyPublisher<[Quote], Error> {
        
        return dataSource.getCharacterQuotes(id: id).map { serverQuote -> [Quote] in
            
            var quotes: [Quote] = []
            
            for serverQuote in serverQuote.docs {
                
                let quote = serverQuote.convertToEntity()
                
                quotes.append(quote)
            }
            
            return quotes
        }
        .mapError({ $0 })
        .eraseToAnyPublisher()
    }
    
    func getMovieQuotes(id: String) -> AnyPublisher<[Quote], Error> {
        
        return dataSource.getMovieQuotes(id: id).map { serverQuote -> [Quote] in
            
            var quotes: [Quote] = []
            
            for serverQuote in serverQuote.docs {
                
                let quote = serverQuote.convertToEntity()
                
                quotes.append(quote)
            }
            
            return quotes
        }
        .mapError({ $0 })
        .eraseToAnyPublisher()
    }
    
    
}
