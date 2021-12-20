//
//  ChapterRepositoryImplementationUnitTest.swift
//  TheOneAppTests
//
//  Created by Silvia España on 20/12/21.
//

import XCTest
import Combine
@testable import TheOneApp

class ChapterRepositoryImplementationUnitTest: XCTestCase {
    
    var sut: ChapterRepositoryImplementation!
    
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
    
    func testGetChaptersByIdOK() throws {
        
        // Given
        let endpointBook = "book"
        let endpointChapter = "chapter"
        let id = "5cf5805fb53e011a64671582"
        
        let session = getChapterSession(statusCode: sucessStatusCode, endpointBook: endpointBook, id: id, endpointChapter: endpointChapter)
        
        let remote = ChapterDataSource(baseURL: baseUrlString, session: session)
        
        sut = ChapterRepositoryImplementation(dataSource: remote)
        
        let exp = self.expectation(description: "Expected Values")
        
        // When
        cancellable = sut!.getChaptersByBookId(id: id)
            .sink(receiveCompletion: { completion in
                
                switch completion {
                    
                case.finished:
                    exp.fulfill()
                    
                case.failure:
                    break
                }
                
            }, receiveValue: { chapter in
                
                XCTAssertEqual(chapter.count, 1)
                XCTAssertEqual(chapter.first?.id, "6091b6d6d58360f988133b8b")
                XCTAssertEqual(chapter.first?.chapterName, "A Long-expected Party")
            })
        
        wait(for: [exp], timeout: timeoutTime)
        
        // Then
        XCTAssertNotNil(cancellable)
    }
    
    func testGetChaptersByIdError() throws {
        
        // Given
        let endpointBook = "book"
        let endpointChapter = "chapter"
        let id = "5cf5805fb53e011a64671582"
        
        let session = getChapterSession(statusCode: failureStatusCode, endpointBook: endpointBook, id: id, endpointChapter: endpointChapter)
        
        let remote = ChapterDataSource(baseURL: baseUrlString, session: session)
        
        sut = ChapterRepositoryImplementation(dataSource: remote)
        
        let exp = self.expectation(description: "Expected Values")
        
        // When
        cancellable = sut!.getChaptersByBookId(id: id)
            .sink(receiveCompletion: { completion in
                
                switch completion {
                    
                case.finished:
                    break
                    
                case.failure:
                    exp.fulfill()
                }
                
            }, receiveValue: { chapter in
                
               //nothing
            })
        
        wait(for: [exp], timeout: timeoutTime)
        
        // Then
        XCTAssertNotNil(cancellable)
    }
}

extension ChapterRepositoryImplementationUnitTest {
    
    func getChapterSession(statusCode: Int, endpointBook: String, id: String, endpointChapter: String ) -> URLSession {
        
        //URL we expect to call
        let url = URL(string: "http://jsonplaceholder.typicode.com/\(endpointBook)/\(id)/\(endpointChapter)")
        
        // data we expect to receive
        let data = getChapterData()
        
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
    
    func getChapterData() -> Data {
        
        let dataString = """
                    {
                        "docs":[
                            {
                                "_id": "6091b6d6d58360f988133b8b",
                                "chapterName": "A Long-expected Party"
                            }
                        ]
                    }
                    """
        
        return Data(dataString.utf8)
    }
}
