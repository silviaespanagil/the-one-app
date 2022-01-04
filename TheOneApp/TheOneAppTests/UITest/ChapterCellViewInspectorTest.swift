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
        super.setUp()
    }
    
    override func tearDownWithError() throws {
        super.tearDown()
    }
    
    // Given
    let sut =  ChapterCellView(id: "id", chapterName: "A Knife in the Dark")
    
    
    func testChapterNameSetUp() throws {
        
        // When
        let tag = "chapterName"
        let chapterNameLabel = try! sut.inspect().find(viewWithTag: tag).text().string()
        
        // Then
        XCTAssertEqual(self.sut.chapterName, chapterNameLabel)
    }  
}

