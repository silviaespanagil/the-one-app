//
//  MovieCellViewInspectorTest.swift
//  TheOneAppTests
//
//  Created by Silvia España on 22/12/21.
//

@testable import TheOneApp
import XCTest
import ViewInspector
import SwiftUI

extension MovieCellView: Inspectable { }

class MovieCellViewInspectorTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // Given
    let sut =  MovieCellView(name: "The Fellowship Of The Ring", image: "image")

    func testMovieNameSetUp() throws {
        
        let exp = sut.inspection.inspect { view in
            
            // When
            let movieNameLabel = try! view.vStack(0).image(0).overlay(1).text(0).string()
            
            // Then
            XCTAssertEqual(self.sut.name, movieNameLabel)
        }
        
        ViewHosting.host(view: sut)
        wait(for: [exp], timeout: 2)
    }

}
