//
//  QuoteRepositoryImplementationUnitTest.swift
//  TheOneAppTests
//
//  Created by Silvia España on 21/12/21.
//

import XCTest
import Combine
@testable import TheOneApp

class QuoteRepositoryImplementationUnitTest: XCTestCase {
    
    var sut: QuoteRepositoryImplementation!
    
    var cancellable: AnyCancellable?
    
    let baseUrlString = "http://jsonplaceholder.typicode.com/"
    
    let sucessStatusCode = 200
    let failureStatusCode = 401
    let timeoutTime: TimeInterval = 2
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        sut = nil
        try super.tearDownWithError()
    }
    
    func testGetQuotesOK() throws {
        
        // Given
        let endpoint = "quote"
        
        let session = getQuoteSession(statusCode: sucessStatusCode, endpoint: endpoint)
        
        let remote = QuoteDataSource(baseURL: baseUrlString, session: session)
        
        sut = QuoteRepositoryImplementation(dataSource: remote)
        
        let exp = self.expectation(description: "Expected Values")
        
        // When
        cancellable = sut!.getAllQuotes()
            .sink(receiveCompletion: { completion in
                
                switch completion {
                    
                case.finished:
                    exp.fulfill()
                    
                case.failure:
                    break
                }
                
            }, receiveValue: { quote in
                
                XCTAssertEqual(quote.count, 1)
                XCTAssertEqual(quote.first?.id, "5cd96e05de30eff6ebcce832")
                XCTAssertEqual(quote.first?.dialog, "Be careful. Even in defeat, Saruman is dangerous.  ")
                XCTAssertEqual(quote.first?.movie, "5cd95395de30eff6ebccde5d")
                XCTAssertEqual(quote.first?.character, "5cd99d4bde30eff6ebccfea0")
            })
        
        wait(for: [exp], timeout: timeoutTime)
        
        // Then
        XCTAssertNotNil(cancellable)
    }
    
        func testGetAllQuotesError() throws {
    
            let endpoint = "quote"
            
            let session = getQuoteSession(statusCode: failureStatusCode, endpoint: endpoint)
            
            let remote = QuoteDataSource(baseURL: baseUrlString, session: session)
            
            sut = QuoteRepositoryImplementation(dataSource: remote)
            
            let exp = self.expectation(description: "Expected Values")
            
            // When
            cancellable = sut!.getAllQuotes()
                .sink(receiveCompletion: { completion in
    
                    switch completion {
    
                    case.finished:
                        break
    
                    case.failure:
                        exp.fulfill()
                    }
    
                }, receiveValue: { quote in
    
                   //nothing
                })
    
            wait(for: [exp], timeout: timeoutTime)
    
            // Then
            XCTAssertNotNil(cancellable)
        }
    
    func testGetCharacterQuoteOK() throws {
        
        // Given
        let endpointCharacter = "character"
        let endpointQuote = "quote"
        let id = "5cd99d4bde30eff6ebccfea0"
        
        let session = getCharacterOrMovieQuoteSession(statusCode: sucessStatusCode, endpointA: endpointCharacter, id: id, endpointB: endpointQuote)
        
        let remote = QuoteDataSource(baseURL: baseUrlString, session: session)
        
        sut = QuoteRepositoryImplementation(dataSource: remote)
        
        let exp = self.expectation(description: "Expected Values")
        
        // When
        cancellable = sut!.getCharacterQuotes(id: id)
            .sink(receiveCompletion: { completion in
                
                switch completion {
                    
                case.finished:
                    exp.fulfill()
                    
                case.failure:
                    break
                }
                
            }, receiveValue: { quote in
                
                XCTAssertEqual(quote.count, 1)
                XCTAssertEqual(quote.first?.id, "5cd96e05de30eff6ebcce832")
                XCTAssertEqual(quote.first?.dialog, "Be careful. Even in defeat, Saruman is dangerous.  ")
                XCTAssertEqual(quote.first?.movie, "5cd95395de30eff6ebccde5d")
                XCTAssertEqual(quote.first?.character, "5cd99d4bde30eff6ebccfea0")
            })
        
        wait(for: [exp], timeout: timeoutTime)
        
        // Then
        XCTAssertNotNil(cancellable)
    }
    
    func testGetMovieQuoteOK() throws {
        
        // Given
        let endpointMovie = "movie"
        let endpointQuote = "quote"
        let id = "5cd95395de30eff6ebccde5d"
        
        let session = getCharacterOrMovieQuoteSession(statusCode: sucessStatusCode, endpointA: endpointMovie, id: id, endpointB: endpointQuote)
        
        let remote = QuoteDataSource(baseURL: baseUrlString, session: session)
        
        sut = QuoteRepositoryImplementation(dataSource: remote)
        
        let exp = self.expectation(description: "Expected Values")
        
        // When
        cancellable = sut!.getMovieQuotes(id: id)
            .sink(receiveCompletion: { completion in
                
                switch completion {
                    
                case.finished:
                    exp.fulfill()
                    
                case.failure:
                    break
                }
                
            }, receiveValue: { quote in
                
                XCTAssertEqual(quote.count, 1)
                XCTAssertEqual(quote.first?.id, "5cd96e05de30eff6ebcce832")
                XCTAssertEqual(quote.first?.dialog, "Be careful. Even in defeat, Saruman is dangerous.  ")
                XCTAssertEqual(quote.first?.movie, "5cd95395de30eff6ebccde5d")
                XCTAssertEqual(quote.first?.character, "5cd99d4bde30eff6ebccfea0")
            })
        
        wait(for: [exp], timeout: timeoutTime)
        
        // Then
        XCTAssertNotNil(cancellable)
    }
}

extension QuoteRepositoryImplementationUnitTest {
    
    func getQuoteSession(statusCode: Int, endpoint: String) -> URLSession {
        
        //URL we expect to call
        let url = URL(string: "http://jsonplaceholder.typicode.com/\(endpoint)")
        
        // data we expect to receive
        let data = getQuoteData()
        
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
    
    func getCharacterOrMovieQuoteSession(statusCode: Int, endpointA: String, id: String, endpointB: String) -> URLSession {
        
        //URL we expect to call
        let url = URL(string: "http://jsonplaceholder.typicode.com/\(endpointA)/\(id)/\(endpointB)")
        
        // data we expect to receive
        let data = getQuoteData()
        
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
    
    func getQuoteData() -> Data {
        
        let dataString = """
                    {
                        "docs":[
                            {
                            "_id": "5cd96e05de30eff6ebcce832",
                            "dialog": "Be careful. Even in defeat, Saruman is dangerous.  ",
                            "movie": "5cd95395de30eff6ebccde5d",
                            "character": "5cd99d4bde30eff6ebccfea0"
                    }
                        ]
                    }
                    """
        
        return Data(dataString.utf8)
    }
}

