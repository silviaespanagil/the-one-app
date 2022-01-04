//
//  CharacterCellViewInspectorTest.swift
//  TheOneAppTests
//
//  Created by Silvia España on 22/12/21.
//

@testable import TheOneApp
import XCTest
import ViewInspector
import SwiftUI

extension CharacterCellView: Inspectable { }

class CharacterCellViewInspectorTest: XCTestCase {
    
    override func setUpWithError() throws {
        super.setUp()
    }
    
    override func tearDownWithError() throws {
        super.tearDown()
    }
    
    // Given
    let sut = CharacterCellView(id: "5cd99d4bde30eff6ebccfc07", race: "Elf", name: "Arwen", image:  "https://pbs.twimg.com/profile_images/378800000054269606/3dd75f69faf233c299b7428a1c0ea811.jpeg")
    
    func testNameSetUp() {
        
        // When
        let tag = "characterName"
        let nameLabel = try! sut.inspect().find(viewWithTag: tag).text().string()
        
        // Then
        XCTAssertEqual(self.sut.name, nameLabel)
    }
    
    func testRaceSetUp() {
        
        // When
        let tag = "characterRace"
        let raceLabel = try! sut.inspect().find(viewWithTag: tag).text().string()
        
        // Then
        XCTAssertEqual(self.sut.race, raceLabel)
    }
}
