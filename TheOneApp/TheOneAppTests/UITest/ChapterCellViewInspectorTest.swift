//
//  ChapterCellViewInspectorTest.swift
//  TheOneAppTests
//
//  Created by Silvia España on 22/12/21.
//

@testable import TheOneApp
import XCTest
import ViewInspector
import SwiftUI

extension ChapterCellView: Inspectable { }

class ChapterCellViewInspectorTest: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // Given
    let sut =  ChapterCellView(id: "id", chapterName: "A Knife in the Dark")
    
    
    func testChapterNameSetUp() throws {
        
        let exp = sut.inspection.inspect { view in
            
            // When
            let chapterNameLabel = try! view.hStack(0).vStack(0).text(0).string()
            
            // Then
            XCTAssertEqual(self.sut.chapterName, chapterNameLabel)
        }
        ViewHosting.host(view: sut)
        wait(for: [exp], timeout: 2)
    }  
}

