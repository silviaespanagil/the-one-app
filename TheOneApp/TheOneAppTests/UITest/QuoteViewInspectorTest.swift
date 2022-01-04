//
//  QuoteViewInspectorTest.swift
//  TheOneAppTests
//
//  Created by Silvia España on 22/12/21.
//

@testable import TheOneApp
import XCTest
import ViewInspector
import SwiftUI

extension QuoteView: Inspectable { }
extension QuoteItemView: Inspectable { }


class QuoteViewInspectorTest: XCTestCase {
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        
        try super.tearDownWithError()
    }
    
    func testQuoteText() throws {
        
        // Given
        let viewModel = QuoteViewModel()
        let tag = "quoteText"
        let quote = ""
        let sut =  QuoteView(viewModel: viewModel)
        
        // When
        let quoteText = try! sut.inspect().find(viewWithTag: tag).text().string()
    
        // Then
        XCTAssertNotNil(quoteText)
        XCTAssertEqual("\"\(quote)\"", quoteText)
    }
}

