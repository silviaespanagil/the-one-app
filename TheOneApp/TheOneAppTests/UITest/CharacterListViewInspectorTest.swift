//
//  CharacterListViewInspectorTest.swift
//  TheOneAppTests
//
//  Created by Silvia España on 21/12/21.
//

@testable import TheOneApp
import XCTest
import ViewInspector
import SwiftUI

extension CharacterListView: Inspectable { }
extension Inspection: InspectionEmissary { }

final class CharacterListViewInspectorTest: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
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
    
    func testRaceFilterValues() throws {
        
        // Given
        let raceFilter = try sut.inspect().find(viewWithTag: "RaceFilter").picker().labelView().text().string()
        
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
