//
//  MovieRepositoryImplementationUnitTest.swift
//  TheOneAppTests
//
//  Created by Silvia España on 16/12/21.
//

import XCTest
import Combine
@testable import TheOneApp

class MovieRepositoryImplementationUnitTest: XCTestCase {
    
    var sut: MovieRepositoryImplementation!
    
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
    
    func testGetAllMoviesOK() throws {
        
        // Given
        let endpoint = "movie"
        let session = getMovieSession(statusCode: sucessStatusCode, endpoint: endpoint)
        
        let remote = MovieDataSource(baseURL: baseUrlString, session: session)
        
        sut = MovieRepositoryImplementation(dataSource: remote)
        
        let exp = self.expectation(description: "expected values")
        
        // When
        cancellable = sut!.getAllMovies()
            .sink(receiveCompletion: { completion in
                
                switch completion {
                    
                case.finished:
                    exp.fulfill()
                    
                case.failure:
                    break
                }
                
            }, receiveValue: { movie in
                
                XCTAssertEqual(movie.count, 1)
                XCTAssertEqual(movie.first?.id, "5cd95395de30eff6ebccde56")
                XCTAssertEqual(movie.first?.name, "The Lord of the Rings Series")
                XCTAssertEqual(movie.first?.runtime, 558)
                XCTAssertEqual(movie.first?.budget, 281)
                XCTAssertEqual(movie.first?.revenue, 2917)
                XCTAssertEqual(movie.first?.oscarNominations, 30)
                XCTAssertEqual(movie.first?.oscarWins, 17)
                XCTAssertEqual(movie.first?.rottenTomatoesScore, 94)
            })
        
        wait(for: [exp], timeout: timeoutTime)
        
        // Then
        XCTAssertNotNil(cancellable)
    }
    
    func testGetMoviesError() {
        
        // Given
        let endpoint = "movie"
        let session = getMovieSession(statusCode: failureStatusCode, endpoint: endpoint)
        
        let remote = MovieDataSource(baseURL: baseUrlString, session: session)
        
        sut = MovieRepositoryImplementation(dataSource: remote)
        
        let exp = self.expectation(description: "expected values")
        
        // When
        cancellable = sut!.getAllMovies()
            .sink(receiveCompletion: { completion in
                
                switch completion {
                    
                case.finished:
                    break
                    
                case.failure:
                    exp.fulfill()
                }
                
            }, receiveValue: { movie in
                
                // nothing
            })
        
        wait(for: [exp], timeout: timeoutTime)
        
        // Then
        XCTAssertNotNil(cancellable)
    }
}

extension MovieRepositoryImplementationUnitTest {
    
    func getMovieSession(statusCode: Int, endpoint: String) -> URLSession {
        
        //URL we expect to call
        let url = URL(string: "http://jsonplaceholder.typicode.com/\(endpoint)")
        
        // data we expect to receive
        let data = getMovieData()
        
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
    
    func getMovieData() -> Data {
        
        let dataString = """
                    {
                        "docs":[
                            {
                                "_id": "5cd95395de30eff6ebccde56",
                                        "name": "The Lord of the Rings Series",
                                        "runtimeInMinutes": 558,
                                        "budgetInMillions": 281,
                                        "boxOfficeRevenueInMillions": 2917,
                                        "academyAwardNominations": 30,
                                        "academyAwardWins": 17,
                                        "rottenTomatoesScore": 94
                            }
                        ]
                    }
                    """
        
        return Data(dataString.utf8)
    }
}
