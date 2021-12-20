//
//  GetChaptersByBookUseCaseUnitTest.swift
//  TheOneAppTests
//
//  Created by Silvia España on 20/12/21.
//

import XCTest
@testable import TheOneApp

class GetChaptersByBookUseCaseUnitTest: XCTestCase {
    
    var sut: GetChaptersByBookUseCase?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        sut = nil
        
        try super.tearDownWithError()
    }

    func testGetChaptersByBookIsCalled() {

        // Given
        let repository = MockChapterRepository()
        sut = GetChaptersByBookUseCase(repository: repository)

        // When
        _ = sut!.execute(id: "5cf5805fb53e011a64671582")

        //Then
        XCTAssertTrue(repository.isGetChapterByBookCalled)
    }
}
