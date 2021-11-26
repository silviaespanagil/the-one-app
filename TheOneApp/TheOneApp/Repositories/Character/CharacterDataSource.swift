//
//  CharacterDataSource.swift
//  TheOneApp
//
//  Created by Silvia España on 25/11/21.
//

import Foundation
import Combine

class CharacterDataSource {
    
    static let getAllCharactersURL: String = "character/"
    
    private let baseURLString: String
    private let session: URLSession
    
    init(baseURL: String = Constants.baseURL, session: URLSession = URLSession.shared) {
        
        self.baseURLString = baseURL
        self.session = session
    }
    
    func getAllCharacters() -> AnyPublisher<ServerBaseArrayResponse<ServerCharacterResponse>, Error> {
        
        let apiManager = APIManager(baseURL: baseURLString,session: session)
        
        let urlRequest = getAllCharactersEndpoint()
        
        return apiManager.performRequest(urlRequest: urlRequest)
        
    }
}

// MARK: Endpoints

extension CharacterDataSource {
    
    func getAllCharactersEndpoint() -> URLRequest{
        
        let endpoint = "\(baseURLString)\(CharacterDataSource.getAllCharactersURL)"
        
        let components = URLComponents(string: endpoint)
        
        var urlRequest = URLRequest(url: (components?.url!)!)
        urlRequest.setValue(String(format: Constants.authorizationHeader), forHTTPHeaderField: "Authorization")
        
        return urlRequest
    }
}
