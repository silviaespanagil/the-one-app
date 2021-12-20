//
//  ServerBookResponseUnitTest.swift
//  TheOneAppTests
//
//  Created by Silvia España on 20/12/21.
//

import XCTest
@testable import TheOneApp

class ServerBookResponseUnitTest: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        try super.tearDownWithError()
    }
    
    func testConvertToEntity() throws {
        
        // Given
        
        let serverBookResponse = ServerBookResponse(_id: "5cf5805fb53e011a64671582",
                                                    name: "The Fellowship Of The Ring",
                                                    bookImage: "https://i1.wp.com/www.casualoptimist.com/wp-content/uploads/2020/09/fellowship-of-the-ring-illustration-johan-egerkrans.jpg?w=1650")
        
        // When
        
        let book = serverBookResponse.convertToEntity()
        
        // Then
        
        XCTAssertNotNil(book)
        XCTAssertEqual(book.id, serverBookResponse._id)
        XCTAssertEqual(book.name, serverBookResponse.name)
    }
}
