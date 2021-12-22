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
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        try super.tearDownWithError()
    }
    
    func testQuoteText() throws {
        
        // Given
        
        let viewModel = QuoteViewModel()
        let sut =  QuoteView(viewModel: viewModel)
        
        let exp = sut.inspection.inspect { view in
            
            // When
            
            let quoteText = try! view.vStack(0).color(0).overlay(0).view(QuoteItemView.self,0).vStack(0).text(1).string()
            
            XCTAssertNotNil(quoteText, "")
        }
        
        ViewHosting.host(view: sut)
        wait(for: [exp], timeout: 2)
    }
}

