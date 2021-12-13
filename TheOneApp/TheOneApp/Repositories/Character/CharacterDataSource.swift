//
//  CharacterDataSource.swift
//  TheOneApp
//
//  Created by Silvia España on 25/11/21.
//

import Foundation
import Combine

class CharacterDataSource {
    
    static let getAllCharactersURL: String = "character"
    static let getPage: String = "?page="
    
    private let baseURLString: String
    private let session: URLSession
    
    init(baseURL: String = Constants.baseURL, session: URLSession = URLSession.shared) {
        
        self.baseURLString = baseURL
        self.session = session
    }
    
    func getAllCharacters(page: Int) -> AnyPublisher<ServerBaseArrayResponse<ServerCharacterResponse>, Error> {
        
        let apiManager = APIManager(baseURL: baseURLString, session: session)
        
        let urlRequest = getAllCharactersEndpoint(page: page)
        
        return apiManager.performRequest(urlRequest: urlRequest)
        
    }
    
    func getCharacterDetail(id: String) -> AnyPublisher<ServerCharacterResponse, Error> {
        
        let apiManager = APIManager(baseURL: baseURLString, session: session)
        
        let urlRequest = getCharacterDetailEndpoint(id: id)
        
        return apiManager.performRequest(urlRequest: urlRequest)
    }
}

// MARK: Endpoints

extension CharacterDataSource {
    
    func getAllCharactersEndpoint(page: Int) -> URLRequest {
        
        let endpoint = "\(baseURLString)\(CharacterDataSource.getAllCharactersURL)\(CharacterDataSource.getPage)\(page)"
        
        let components = URLComponents(string: endpoint)
        
        let urlRequest = URLRequest(url: (components?.url!)!)
        
        return urlRequest
    }
    
    func getCharacterDetailEndpoint(id: String) -> URLRequest {
        
        let endpoint = "\(baseURLString)\(CharacterDataSource.getAllCharactersURL)/\(id)"
        
        let components = URLComponents(string: endpoint)
        
        let urlRequest = URLRequest(url: (components?.url!)!)
        
        return urlRequest
    }
}
