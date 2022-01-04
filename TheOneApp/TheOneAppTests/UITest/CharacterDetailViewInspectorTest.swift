//
//  CharacterDetailViewInspectorTest.swift
//  TheOneAppTests
//
//  Created by Silvia España on 23/12/21.
//

@testable import TheOneApp
import XCTest
import ViewInspector
import SwiftUI

extension CharacterDetailView: Inspectable { }

class CharacterDetailViewInspectorTest: XCTestCase {

    override func setUpWithError() throws {
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        
        try super.tearDownWithError()
    }
    
    let sut =  CharacterDetailView(viewModel: CharacterDetailViewModel(character: Character(id: "id", height: "height", race: Race(rawValue: "Elf"), gender: "Female", birth: "birth", spouse: "spouse", death: "death", realm: "realm", hair: "hair", name: "Arwen", wikiURL: "wikiurl", imageRace: "image")))
    
    func testDetailCharacterIntro() throws {
      
        // When
        let tag = "detailIntroText"
        let detailIntro = try! sut.inspect().find(viewWithTag: tag).text().string()
        
        // Then
        XCTAssertNotNil(detailIntro)
        XCTAssertEqual(self.sut.viewModel.character.name, detailIntro)
    }
    
    func testRaceValue() throws {
      
        // When
        let tag = "race"
        let raceValue = try! sut.inspect().find(viewWithTag: tag).text().string()
        
        // Then
        XCTAssertNotNil(raceValue)
        XCTAssertEqual(self.sut.viewModel.character.race, Race(rawValue: raceValue))
    }
    
    func testBirthValue() throws {
        
        // When
        let infoTag = "birth"
        let detailTag = "movieInfoDetail"
        let birthValue = try! sut.inspect().find(viewWithTag: infoTag).find(viewWithTag: detailTag).text().string()
        
        // Then
        XCTAssertNotNil(birthValue)
        XCTAssertEqual(self.sut.viewModel.character.birth, birthValue)
    }
    
    func testDeathValue() throws {
        
        // When
        let infoTag = "death"
        let detailTag = "movieInfoDetail"
        let deathValue = try! sut.inspect().find(viewWithTag: infoTag).find(viewWithTag: detailTag).text().string()
        
        // Then
        XCTAssertNotNil(deathValue)
        XCTAssertEqual(self.sut.viewModel.character.death, deathValue)
    }
    
    func testSpouseValue() throws {
        
        // When
        let infoTag = "spouse"
        let detailTag = "movieInfoDetail"
        let spouseValue = try! sut.inspect().find(viewWithTag: infoTag).find(viewWithTag: detailTag).text().string()
        
        // Then
        XCTAssertNotNil(spouseValue)
        XCTAssertEqual(self.sut.viewModel.character.spouse, spouseValue)
    }

}
