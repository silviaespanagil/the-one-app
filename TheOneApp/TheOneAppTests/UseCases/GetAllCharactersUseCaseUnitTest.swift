//
//  GetAllCharactersUseCaseUnitTest.swift
//  TheOneAppTests
//
//  Created by Silvia España on 15/12/21.
//

import XCTest
@testable import TheOneApp

class GetAllCharactersUseCaseUnitTest: XCTestCase {

    var sut: GetAllCharactersUseCase?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        
        try super.tearDownWithError()
    }
    
    func testGetCharactersIsCalled(){
        
        //GIVEN
        let repository = MockCharacterRepository()
        sut = GetAllCharactersUseCase(repository: repository)
        
        //WHEN
        _ = sut!.execute(page: 1)
        
        //THEN
        XCTAssertTrue(repository.isGetAllCharactersCalled)
    }
}
