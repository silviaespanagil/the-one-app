//
//  CharacterListViewInspectorTest.swift
//  TheOneAppTests
//
//  Created by Silvia España on 21/12/21.
//

import XCTest
import ViewInspector
@testable import TheOneApp
import SwiftUI

extension CharacterListView: Inspectable { }
extension Inspection: InspectionEmissary { }

final class CharacterListViewInspectorTest: XCTestCase {
    
    // Given
    let sut = CharacterListView(viewModel: CharacterListViewModel())

    func testCharacterListRenders() throws {
        
        // When
        let characterList = try sut.inspect().find(viewWithTag: "CharacterListWrapper")
        
        // Then
        XCTAssertNotNil(characterList)
    }
    
    func testRaceFilterRenders() throws {
        
        // When
        let raceFilter = try sut.inspect().find(viewWithTag: "RaceFilter")
        
        // Then
        XCTAssertNotNil(raceFilter)
    }
    
    func testOnAppearIsCalled() {
    
        let exp = sut.inspection.inspect { view in
            
            XCTAssertNotNil(try view.actualView().onAppear())
        }
        ViewHosting.host(view: sut)
        wait(for: [exp], timeout: 0.1)
    }
}
