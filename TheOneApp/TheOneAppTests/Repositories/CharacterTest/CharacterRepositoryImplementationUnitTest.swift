//
//  CharacterRepositoryImplementationUnitTest.swift
//  TheOneAppTests
//
//  Created by Silvia España on 10/12/21.
//

import XCTest
import Combine
@testable import TheOneApp

class CharacterRepositoryImplementationUnitTest: XCTestCase {
    
    var sut: CharacterRepositoryImplementation!
    
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
    
    func testGetAllCharacterOK() throws {
        
        // Given
        let endpoint = "character"
        let page = 1
        let session = getCharacterSession(statusCode: sucessStatusCode, endpoint: endpoint, page: page)
        
        let remote = CharacterDataSource(baseURL: baseUrlString, session: session)
        
        sut = CharacterRepositoryImplementation(dataSource: remote)
        
        let exp = self.expectation(description: "expected values")
        
        // When
        cancellable = sut!.getAllCharacters(page: page)
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .finished:
                    exp.fulfill()
                case .failure:
                    break
                }
                
            }, receiveValue: { character in
                
                XCTAssertEqual(character.count, 1)
                XCTAssertEqual(character.first?.id, "5cd99d4bde30eff6ebccfbbe")
                XCTAssertEqual(character.first?.height, "")
                XCTAssertEqual(character.first?.race?.description, "Human")
                XCTAssertEqual(character.first?.gender, "Female")
                XCTAssertEqual(character.first?.birth, "")
                XCTAssertEqual(character.first?.spouse, "Belemir")
                XCTAssertEqual(character.first?.death, "")
                XCTAssertEqual(character.first?.realm, "")
                XCTAssertEqual(character.first?.hair, "")
                XCTAssertEqual(character.first?.name, "Adanel")
            })
        
        wait(for: [exp], timeout: timeoutTime)
        
        // Then
        XCTAssertNotNil(cancellable)
    }
    
    func testGetCharacterError() {
        
        // Given
        let endpoint = "character"
        let page = 1
        let session = getCharacterSession(statusCode: failureStatusCode, endpoint: endpoint, page: page)
        
        let remote = CharacterDataSource(baseURL: baseUrlString, session: session)
        
        sut = CharacterRepositoryImplementation(dataSource: remote)
        
        let exp = expectation(description: "expected values")
        
        // When
        cancellable = sut!.getAllCharacters(page: page)
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .finished:
                    break
                case .failure:
                    exp.fulfill()
                }
                
            }, receiveValue: { character in
                
                // nothing
            })
        
        wait(for: [exp], timeout: timeoutTime)
        
        // Then
        XCTAssertNotNil(cancellable)
    }
}


extension CharacterRepositoryImplementationUnitTest {
    
    func getCharacterSession(statusCode: Int, endpoint: String, page: Int) -> URLSession {
        
        // URL we expect to call
        let url = URL(string: "http://jsonplaceholder.typicode.com/\(endpoint)?page=\(page)")
        
        // data we expect to receive
        let data = getCharacterData()
        
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
    
    func getCharacterData() -> Data {
        
        let dataString = """
                    
                    {
                        "docs":[
                            {
                                "_id": "5cd99d4bde30eff6ebccfbbe",
                                "height": "",
                                "race": "Human",
                                "gender": "Female",
                                "birth": "",
                                "spouse": "Belemir",
                                "death": "",
                                "realm": "",
                                "hair": "",
                                "name": "Adanel",
                                "wikiUrl": "http://lotr.wikia.com//wiki/Adanel"
                            }
                        ]
                    }
                    
                    """
        
        return Data(dataString.utf8)
    }
}
