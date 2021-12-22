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
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // Given
    let sut =  MainCellView(name: "Characters")
    
    func testMenuTitleSetUp() throws {
        
        let exp = sut.inspection.inspect { view in
            
            // When
            let menuLabel = try! view.hStack(0).text(0).string()
            
            // Then
            XCTAssertEqual(self.sut.name, menuLabel)
        }
        
        ViewHosting.host(view: sut)
        wait(for: [exp], timeout: 2)
    }
    
}
