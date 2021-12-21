//
//  GetMovieQuotesUseCaseUnitTest.swift
//  TheOneAppTests
//
//  Created by Silvia España on 21/12/21.
//

import XCTest
@testable import TheOneApp

class GetMovieQuotesUseCaseUnitTest: XCTestCase {
    
    var sut: GetMovieQuotesUseCase?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        sut = nil
        
        try super.tearDownWithError()
    }
    
    func testGetMovieQuotesIsCalled() {
        
        // Given
        let repository = MockQuoteRepository()
        sut = GetMovieQuotesUseCase(repository: repository)
        
        // When
        _ = sut!.execute(id: "5cd95395de30eff6ebccde5d")
        
        //Then
        XCTAssertTrue(repository.isGetMovieQuoteCalled)
    }
}
