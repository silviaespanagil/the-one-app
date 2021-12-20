//
//  GetCharacterDetailUseCaseUnitTest.swift
//  TheOneAppTests
//
//  Created by Silvia España on 15/12/21.
//

import XCTest
@testable import TheOneApp

class GetCharacterDetailUseCaseUnitTest: XCTestCase {

    var sut: GetCharacterDetailUseCase?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        
        try super.tearDownWithError()
    }
    
    func testGetCharacterDetailIsCalled(){
        
        //GIVEN
        let repository = MockCharacterRepository()
        sut = GetCharacterDetailUseCase(repository: repository)
        
        //WHEN
        _ = sut!.execute(id : "5cdbdecb6dc0baeae48cfaa6")
        
        //THEN
        XCTAssertTrue(repository.isCharacterDetailCalled)
    }
}
