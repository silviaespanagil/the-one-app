//
//  QuoteDataSource.swift
//  TheOneApp
//
//  Created by Silvia España on 21/12/21.
//

import Foundation
import Combine

class QuoteDataSource {
    
    static let getAllQuotesURL: String = "quote"
    static let getMovieURL: String = "movie"
    static let getCharacterURL: String = "character"
    
    private let baseURLString: String
    private let session: URLSession
    
    init(baseURL: String = Constants.baseURL, session: URLSession = URLSession.shared) {
        
        self.baseURLString = baseURL
        self.session = session
    }
    
    func getAllQuotes() -> AnyPublisher<ServerBaseArrayResponse<ServerQuoteResponse>, Error> {
        
        let apiManager = APIManager(baseURL: baseURLString, session: session)
        
        let urlRequest = getAllQuotesEndpoint()
        
        return apiManager.performRequest(urlRequest: urlRequest)
    }
    
    func getCharacterQuotes(id: String) -> AnyPublisher<ServerBaseArrayResponse<ServerQuoteResponse>, Error> {
        
        let apiManager = APIManager(baseURL: baseURLString, session: session)
        
        let urlRequest =  getCharacterQuotesEndpoint(id: id)
        
        return apiManager.performRequest(urlRequest: urlRequest)
    }
    
    func getMovieQuotes(id: String) -> AnyPublisher<ServerBaseArrayResponse<ServerQuoteResponse>, Error> {
        
        let apiManager = APIManager(baseURL: baseURLString, session: session)
        
        let urlRequest =  getMovieQuotesEndpoint(id: id)
        
        return apiManager.performRequest(urlRequest: urlRequest)
    }
}

// MARK: Endpoints

extension QuoteDataSource {
    
    func getAllQuotesEndpoint() -> URLRequest {
        
        let endpoint = "\(baseURLString)\(QuoteDataSource.getAllQuotesURL)"
        
        let components = URLComponents(string: endpoint)
        
        let urlRequest = URLRequest(url: (components?.url!)!)
        
        return urlRequest
    }
    
    func getCharacterQuotesEndpoint(id: String) -> URLRequest {
        
        let endpoint = "\(baseURLString)\(QuoteDataSource.getAllQuotesURL)/\(id)/\(QuoteDataSource.getCharacterURL)"
        
        let components = URLComponents(string: endpoint)
        
        let urlRequest = URLRequest(url: (components?.url!)!)
        
        return urlRequest
    }
    
    func getMovieQuotesEndpoint(id: String) -> URLRequest {
        
        let endpoint = "\(baseURLString)\(QuoteDataSource.getAllQuotesURL)/\(id)/\(QuoteDataSource.getMovieURL)"
        
        let components = URLComponents(string: endpoint)
        
        let urlRequest = URLRequest(url: (components?.url!)!)
        
        return urlRequest
    }
}
