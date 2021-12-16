//
//  MovieDataSource.swift
//  TheOneApp
//
//  Created by Silvia España on 15/12/21.
//

import Foundation
import Combine


class MovieDataSource {
    
    static let getAllMoviesURL: String = "movie"
    
    private let baseURLString: String
    private let session: URLSession
    
    init(baseURL: String = Constants.baseURL, session: URLSession = URLSession.shared) {
        
        self.baseURLString = baseURL
        self.session = session
    }
    
    func getAllMovies() -> AnyPublisher<ServerBaseArrayResponse<ServerMoviesResponse>, Error> {
        
        let apiManager = APIManager(baseURL: baseURLString, session: session)
        
        let urlRequest = getAllMoviesEndpoint()
        
        return apiManager.performRequest(urlRequest: urlRequest)
        
    }
    
    func getMovieDetail(id: String) -> AnyPublisher<ServerMoviesResponse, Error> {
        
        let apiManager = APIManager(baseURL: baseURLString, session: session)
        
        let urlRequest = getMovieDetailEndpoint(id: id)
        
        return apiManager.performRequest(urlRequest: urlRequest)
    }
}

// MARK: Endpoints

extension MovieDataSource {
    
    func getAllMoviesEndpoint() -> URLRequest {
        
        let endpoint = "\(baseURLString)\(MovieDataSource.getAllMoviesURL)"
        
        let components = URLComponents(string: endpoint)
        
        let urlRequest = URLRequest(url: (components?.url!)!)
        
        return urlRequest
    }
    
    func getMovieDetailEndpoint(id: String) -> URLRequest {
        
        let endpoint = "\(baseURLString)\(MovieDataSource.getAllMoviesURL)/\(id)"
        
        let components = URLComponents(string: endpoint)
        
        let urlRequest = URLRequest(url: (components?.url!)!)
        
        return urlRequest
    }
}
