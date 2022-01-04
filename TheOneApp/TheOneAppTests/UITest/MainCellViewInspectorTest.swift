//
//  MainCellViewInspectorTest.swift
//  TheOneAppTests
//
//  Created by Silvia España on 22/12/21.
//

@testable import TheOneApp
import XCTest
import ViewInspector
import SwiftUI

extension MainCellView: Inspectable { }

class MainCellViewInspectorTest: XCTestCase {
    
    override func setUpWithError() throws {
        super.setUp()
    }
    
    override func tearDownWithError() throws {
        super.tearDown()
    }
    
    // Given
    let sut =  MainCellView(name: "Characters")
    
    func testMenuTitleSetUp() throws {
        
        // When
        let menuLabel = try! sut.inspect().find(viewWithTag: "menuTitle").text().string()
        
        // Then
        XCTAssertEqual(self.sut.name, menuLabel)
    }
    
}
