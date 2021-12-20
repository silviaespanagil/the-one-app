//
//  BookRepositoryImplementationUnitTest.swift
//  TheOneAppTests
//
//  Created by Silvia España on 20/12/21.
//

import XCTest
import Combine
@testable import TheOneApp

class BookRepositoryImplementationUnitTest: XCTestCase {

    var sut: BookRepositoryImplementation!
    
    var cancellable: AnyCancellable?
    
    let baseUrlString = "http://jsonplaceholder.typicode.com/"
    
    let sucessStatusCode = 200
    let failureStatusCode = 401
    let timeoutTime: TimeInterval = 2
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        
        sut = nil
        try super.tearDownWithError()
    }
    
    func testGetAllBooksOK() throws {
        
        // Given
        let endpoint = "book"
        let session = getBookSession(statusCode: sucessStatusCode, endpoint: endpoint)
        
        let remote = BookDataSource(baseURL: baseUrlString, session: session)
        
        sut = BookRepositoryImplementation(dataSource: remote)
        
        let exp = self.expectation(description: "expected values")
        
        // When
        cancellable = sut!.getAllBooks()
            .sink(receiveCompletion: { completion in
                
                switch completion {
                    
                case.finished:
                    exp.fulfill()
                    
                case.failure:
                    break
                }
                
            }, receiveValue: { book in
                
                XCTAssertEqual(book.count, 1)
                XCTAssertEqual(book.first?.id, "5cf5805fb53e011a64671582")
                XCTAssertEqual(book.first?.name, "The Fellowship Of The Ring")
            })
        
        wait(for: [exp], timeout: timeoutTime)
        
        // Then
        XCTAssertNotNil(cancellable)
    }
    
    func testGetBooksError() {
        
        // Given
        let endpoint = "book"
        let session = getBookSession(statusCode: failureStatusCode, endpoint: endpoint)
        
        let remote = BookDataSource(baseURL: baseUrlString, session: session)
        
        sut = BookRepositoryImplementation(dataSource: remote)
        
        let exp = self.expectation(description: "expected values")
        
        // When
        cancellable = sut!.getAllBooks()
            .sink(receiveCompletion: { completion in
                
                switch completion {
                    
                case.finished:
                    break
                    
                case.failure:
                    exp.fulfill()
                }
                
            }, receiveValue: { book in
                
                // nothing
            })
        
        wait(for: [exp], timeout: timeoutTime)
        
        // Then
        XCTAssertNotNil(cancellable)
    }
}

extension BookRepositoryImplementationUnitTest {
    
    func getBookSession(statusCode: Int, endpoint: String) -> URLSession {
        
        //URL we expect to call
        let url = URL(string: "http://jsonplaceholder.typicode.com/\(endpoint)")
        
        // data we expect to receive
        let data = getBookData()
        
        // attach that to some fixed data in our protocol handler
        URLProtocolMock.testURLs = [url: data]
        URLProtocolMock.response = HTTPURLResponse(url: URL(string: "http://jsonplaceholder.typicode.com:8080")!,
                                                   statusCode: statusCode,
                                                   httpVersion: nil,
                                                   headerFields: nil)
        
        // now setup a configuration to use our mock
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolMock.self]
        
        // and ceate the URLSession form that
        let session = URLSession(configuration: config)
        
        return session
    }
   
    func getBookData() -> Data {
        
        let dataString = """
                    {
                        "docs":[
                            {
                                "_id": "5cf5805fb53e011a64671582",
                                        "name": "The Fellowship Of The Ring"
                            }
                        ]
                    }
                    """
        
        return Data(dataString.utf8)
    }
}
