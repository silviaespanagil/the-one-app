//
//  MovieDataSourceUnitTest.swift
//  TheOneAppTests
//
//  Created by Silvia España on 16/12/21.
//

import XCTest
@testable import TheOneApp

class MovieDataSourceUnitTest: XCTestCase {
    
    var sut: MovieDataSource?
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
        sut = MovieDataSource(baseURL: "http://jsonplaceholder.typicode.com/")
    }
    
    override func tearDownWithError() throws {
        
        sut = nil
        try super.tearDownWithError()
    }
    
    func testGetAllMoviesEndpoint() throws {
        
        // Given
        let movie = "movie"
        
        // When
        let response = sut!.getAllMoviesEndpoint()
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.url?.absoluteString.split(separator: "?").first, "http://jsonplaceholder.typicode.com/\(movie)")
    }
    
    func testGetMovieDetailEndpoint() throws {
        
        // Given
        let movie = "movie"
        let id = "5cd95395de30eff6ebccde56"
        
        // When
        let response = sut!.getMovieDetailEndpoint(id: id)
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.url?.absoluteString.split(separator: "?").first, "http://jsonplaceholder.typicode.com/\(movie)/\(id)")
    }
}
