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
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // Given
    let sut = CharacterCellView(id: "5cd99d4bde30eff6ebccfc07", race: "Elf", name: "Arwen", image:  "https://pbs.twimg.com/profile_images/378800000054269606/3dd75f69faf233c299b7428a1c0ea811.jpeg")
    
    func testNameSetUp() {
        
        let exp = sut.inspection.inspect { view in
            
            // When
            let nameLabel = try! view.hStack(0).vStack(1).text(0).string()
            
            // Then
            XCTAssertEqual(self.sut.name, nameLabel)
        }
        
        ViewHosting.host(view: sut)
        wait(for: [exp], timeout: 2)
    }
    
    func testRaceSetUp() {
        
        let exp = sut.inspection.inspect { view in
            
            // When
            let raceLabel = try! view.hStack(0).vStack(1).text(1).string()
            
            // Then
            XCTAssertEqual(self.sut.race, raceLabel)
        }
        
        ViewHosting.host(view: sut)
        wait(for: [exp], timeout: 2)
    }
}
