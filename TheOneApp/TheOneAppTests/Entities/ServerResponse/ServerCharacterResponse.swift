//
//  ServerCharacterResponse.swift
//  TheOneAppTests
//
//  Created by Silvia España on 15/12/21.
//

import XCTest
@testable import TheOneApp

class ServerCharaterResponseUnitTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
    }

    func testConvertToEntity() {
        
        // Given
        let serverCharacterResponse = ServerCharacterResponse(_id: "5cdbdecb6dc0baeae48cfaa6",
                                                              height: "height",
                                                              race: "Human",
                                                              gender: "gender",
                                                              birth: "birth",
                                                              spouse: "spouse",
                                                              death: "death",
                                                              realm: "realm",
                                                              hair: "hair",
                                                              name: "name",
                                                              wikiUrl: "wikiUrl",
                                                              imageRace: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlQBUy_zJLmnctr_Dbb0sQJeuqbed-b8LRBQ&usqp=CAU")
        
        // When
        let character = serverCharacterResponse.convertToEntity()
        
        // Then
        XCTAssertEqual(character.id, serverCharacterResponse._id)
        XCTAssertEqual(character.name, serverCharacterResponse.name)
        XCTAssertEqual(character.gender, serverCharacterResponse.gender)
        XCTAssertEqual(character.race?.description, serverCharacterResponse.race)
        XCTAssertEqual(character.birth, serverCharacterResponse.birth)
        XCTAssertEqual(character.spouse, serverCharacterResponse.spouse)
        XCTAssertEqual(character.death, serverCharacterResponse.death)
        XCTAssertEqual(character.realm, serverCharacterResponse.realm)
        XCTAssertEqual(character.hair, serverCharacterResponse.hair)
        XCTAssertEqual(character.name, serverCharacterResponse.name)
        XCTAssertEqual(character.wikiURL, serverCharacterResponse.wikiUrl)
        XCTAssertEqual(character.imageRace, serverCharacterResponse.imageRace)
    }
    
    func testGetImageRace() {
        
        // Given
        
        let imageRace = "https://pm1.narvii.com/6611/6fb86864529b8bea40ebb46f210bb1e307725a22_128.jpg"
        let serverCharacterResponse = ServerCharacterResponse(_id: "5cdbdecb6dc0baeae48cfaa6",
                                                              height: "height",
                                                              race: "Maiar",
                                                              gender: "gender",
                                                              birth: "birth",
                                                              spouse: "spouse",
                                                              death: "death",
                                                              realm: "realm",
                                                              hair: "hair",
                                                              name: "name",
                                                              wikiUrl: "wikiUrl",
                                                              imageRace: "https://pm1.narvii.com/6611/6fb86864529b8bea40ebb46f210bb1e307725a22_128.jpg")
        
        // When
        let image = serverCharacterResponse.getImageRace()
        
        // Then
        
        XCTAssertNotNil(image)
        XCTAssertEqual(image, imageRace)
    }
}
