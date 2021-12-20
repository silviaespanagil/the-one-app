//
//  ChapterDataSource.swift
//  TheOneApp
//
//  Created by Silvia España on 20/12/21.
//

import Foundation
import Combine

class ChapterDataSource {
    
    static let getAllBooksURL: String = "book"
    static let getBookChaptersURL: String = "chapter"
    
    private let baseURLString: String
    private let session: URLSession
    
    init(baseURL: String = Constants.baseURL, session: URLSession = URLSession.shared) {
        
        self.baseURLString = baseURL
        self.session = session
    }
    
    func getChaptersByBookId(id: String) -> AnyPublisher<ServerBaseArrayResponse<ServerChapterResponse>, Error> {
        
        let apiManager = APIManager(baseURL: baseURLString, session: session)
        
        let urlRequest =  getChaptersByBookIdEndpoint(id: id)
        
        return apiManager.performRequest(urlRequest: urlRequest)
    }
}

// MARK: Endpoints

extension ChapterDataSource {
    
    func getChaptersByBookIdEndpoint(id: String) -> URLRequest {
        
        let endpoint = "\(baseURLString)\(ChapterDataSource.getAllBooksURL)/\(id)/\(ChapterDataSource.getBookChaptersURL)"
        
        let components = URLComponents(string: endpoint)
        
        let urlRequest = URLRequest(url: (components?.url!)!)
        
        return urlRequest
    }
}
