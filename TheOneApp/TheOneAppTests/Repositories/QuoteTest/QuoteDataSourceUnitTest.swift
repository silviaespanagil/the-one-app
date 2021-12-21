//
//  QuoteDataSourceUnitTest.swift
//  TheOneAppTests
//
//  Created by Silvia España on 21/12/21.
//

import XCTest
@testable import TheOneApp

class QuoteDataSourceUnitTest: XCTestCase {

    var sut: QuoteDataSource?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        try super.setUpWithError()
        sut = QuoteDataSource(baseURL: "http://jsonplaceholder.typicode.com/")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        sut = nil
        try super.tearDownWithError()
    }
    
    func testGetAllQuotesEndpoint() throws {
        
        // Given
        let quote = "quote"
        
        // When
        let response = sut!.getAllQuotesEndpoint()
        
        // Then
        XCTAssertNotNil(response)
               XCTAssertEqual(response.url?.absoluteString.split(separator: "?").first, "http://jsonplaceholder.typicode.com/\(quote)")
    }
    
    func testGetCharacterQuotesEndpoint() throws {
        
        // Given
        let quote = "quote"
        let id = "5cd99d4bde30eff6ebccfc07"
        let character = "character"
        
        // When
        let response = sut!.getCharacterQuotesEndpoint(id: id)
        
        // Then
        XCTAssertNotNil(response)
               XCTAssertEqual(response.url?.absoluteString.split(separator: "?").first, "http://jsonplaceholder.typicode.com/\(character)/\(id)/\(quote)")
    }
    
    func testGetMovieQuotesEndpoint() throws {
        
        // Given
        let quote = "quote"
        let id = "5cd95395de30eff6ebccde5b"
        let movie = "movie"
        
        // When
        let response = sut!.getMovieQuotesEndpoint(id: id)
        
        // Then
        XCTAssertNotNil(response)
               XCTAssertEqual(response.url?.absoluteString.split(separator: "?").first, "http://jsonplaceholder.typicode.com/\(movie)/\(id)/\(quote)")
    }
}
