//
//  BookDataSourceUnitTest.swift
//  TheOneAppTests
//
//  Created by Silvia España on 20/12/21.
//

import XCTest
@testable import TheOneApp

class BookDataSourceUnitTest: XCTestCase {
    
    var sut: BookDataSource?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        try super.setUpWithError()
        sut = BookDataSource(baseURL: "http://jsonplaceholder.typicode.com/")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        sut = nil
        try super.tearDownWithError()
    }
    
    func testGetAllBooksEndpoint() throws {
        
        // Given
        let book = "book"
        
        // When
        let response = sut!.getAllBooksEndpoint()
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.url?.absoluteString.split(separator: "?").first, "http://jsonplaceholder.typicode.com/\(book)")
    }
    
    func testGetBookChapterEndpoint() throws {
        
        // Given
        let book = "book"
        let chapter = "chapter"
        let id = "5cf5805fb53e011a64671582"
        
        // When
        let response = sut!.getBookChapterEndpoint(id: id)
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.url?.absoluteString.split(separator: "?").first, "http://jsonplaceholder.typicode.com/\(book)/\(id)/\(chapter)")
    }
}
