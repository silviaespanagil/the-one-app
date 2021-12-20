//
//  BookDataSource.swift
//  TheOneApp
//
//  Created by Silvia España on 20/12/21.
//

import Foundation
import Combine

class BookDataSource {
    
    static let getAllBooksURL: String = "book"
    static let getBookChaptersURL: String = "chapter"
    
    private let baseURLString: String
    private let session: URLSession
    
    init(baseURL: String = Constants.baseURL, session: URLSession = URLSession.shared) {
        
        self.baseURLString = baseURL
        self.session = session
    }
    
    func getAllBooks() -> AnyPublisher<ServerBaseArrayResponse<ServerBookResponse>, Error> {
        
        let apiManager = APIManager(baseURL: baseURLString, session: session)
        
        let urlRequest = getAllBooksEndpoint()
        
        return apiManager.performRequest(urlRequest: urlRequest)
        
    }
}

// MARK: Endpoints

extension BookDataSource {
    
    func getAllBooksEndpoint() -> URLRequest {
        
        let endpoint = "\(baseURLString)\(BookDataSource.getAllBooksURL)"
        
        let components = URLComponents(string: endpoint)
        
        let urlRequest = URLRequest(url: (components?.url!)!)
        
        return urlRequest
    }
}
