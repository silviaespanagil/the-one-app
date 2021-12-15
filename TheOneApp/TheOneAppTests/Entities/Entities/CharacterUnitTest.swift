//
//  CharacterUnitTest.swift
//  TheOneAppTests
//
//  Created by Silvia España on 15/12/21.
//

import XCTest
@testable import TheOneApp

class CharacterUnitTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        try super.tearDownWithError()
    }
    
    func testGetRaceIsCalled() {
        
        // Given
        let character = Character(id: "id",
                                  height: "height",
                                  race: Race(rawValue: "Wraith") ?? .NaN,
                                  gender: "gender",
                                  birth: "birth",
                                  spouse: "spouse",
                                  death: "death",
                                  realm: "realm",
                                  hair: "hair",
                                  name: "name",
                                  wikiURL: "wiki",
                                  imageRace: "image")
        
        //When
        let race = character.getRace()
        
        //Then
        XCTAssertNotNil(race)
        XCTAssertEqual(race.description, character.race?.description)
    }
}
