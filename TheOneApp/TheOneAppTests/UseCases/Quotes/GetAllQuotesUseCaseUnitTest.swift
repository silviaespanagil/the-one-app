//
//  GetAllQuotesUseCaseUnitTest.swift
//  TheOneAppTests
//
//  Created by Silvia España on 21/12/21.
//

import XCTest
@testable import TheOneApp

class GetAllQuotesUseCaseUnitTest: XCTestCase {

    var sut: GetAllQuotesUseCase?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        sut = nil
        
        try super.tearDownWithError()
    }

    func testGetAllQuotesIsCalled() {
        
        // Given
        let repository = MockQuoteRepository()
        sut = GetAllQuotesUseCase(repository: repository)
        
        // When
        _ = sut!.execute()
        
        //Then
        XCTAssertTrue(repository.isGetAllQuotesCalled)
    }
}
