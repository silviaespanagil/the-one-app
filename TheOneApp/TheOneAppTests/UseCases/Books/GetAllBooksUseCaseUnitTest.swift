//
//  GetAllBooksUseCaseUnitTest.swift
//  TheOneAppTests
//
//  Created by Silvia España on 20/12/21.
//

import XCTest
@testable import TheOneApp

class GetAllBooksUseCaseUnitTest: XCTestCase {

    var sut: GetAllBooksUseCase?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        sut = nil
        
        try super.tearDownWithError()
    }

    func testGetAllBooksIsCalled() {
        
        // Given
        let repository = MockBookRepository()
        sut = GetAllBooksUseCase(repository: repository)
        
        // When
        _ = sut!.execute()
        
        //Then
        XCTAssertTrue(repository.isGetAllBooksCalled)
    }
}
