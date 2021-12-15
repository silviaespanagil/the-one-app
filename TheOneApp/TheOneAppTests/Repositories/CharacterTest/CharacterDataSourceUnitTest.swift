//
//  CharacterDataSourceUnitTest.swift
//  TheOneAppTests
//
//  Created by Silvia España on 10/12/21.
//

import XCTest
@testable import TheOneApp

class CharacterDataSourceUnitTest: XCTestCase {
    
    var sut: CharacterDataSource?
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
        
        sut = CharacterDataSource(baseURL: "http://jsonplaceholder.typicode.com/")
    }
    
    override func tearDownWithError() throws {
        
        sut = nil
        
        try super.tearDownWithError()
    }
    
    func testGetAllCharactersEndpoint() {
        
        // Given
        let character = "character"
        let page = 7
        
        // When
        let response = sut!.getAllCharactersEndpoint(page: page)
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.url?.absoluteString.split(separator: "?").first, "http://jsonplaceholder.typicode.com/\(character)")
    }
    
    func testGetCharacterDetailEndpoint() {
        
        // Given
        let character = "character/"
        let id = "5cdbdecb6dc0baeae48cfaa6"
        
        // When
        let response = sut!.getCharacterDetailEndpoint(id: id)
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.url?.absoluteString.split(separator: "?").first, "http://jsonplaceholder.typicode.com/\(character)\(id)")
    }
}
