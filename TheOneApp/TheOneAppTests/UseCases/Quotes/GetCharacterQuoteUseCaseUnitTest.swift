//
//  GetCharacterQuoteUseCaseUnitTest.swift
//  TheOneAppTests
//
//  Created by Silvia España on 21/12/21.
//

import XCTest
@testable import TheOneApp

class GetCharacterQuotesUseCaseUnitTest: XCTestCase {
    
    var sut: GetCharacterQuotesUseCase?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        sut = nil
        
        try super.tearDownWithError()
    }
    
    func testGetCharacterQuotesIsCalled() {
        
        // Given
        let repository = MockQuoteRepository()
        sut = GetCharacterQuotesUseCase(repository: repository)
        
        // When
        _ = sut!.execute(id: "5cd99d4bde30eff6ebccfea0")
        
        //Then
        XCTAssertTrue(repository.isGetCharacterQuoteCalled)
    }
}
