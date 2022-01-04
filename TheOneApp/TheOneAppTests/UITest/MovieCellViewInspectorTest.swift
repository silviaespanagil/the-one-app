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
        super.setUp()
    }
    
    override func tearDownWithError() throws {
        super.tearDown()
    }
    
    // Given
    let sut =  MovieCellView(name: "The Fellowship Of The Ring", image: "image")

    func testMovieNameSetUp() throws {
        
        // When
        let label = "movieName"
        let movieNameLabel = try! sut.inspect().find(viewWithTag: label).text().string()
        
        // Then
        XCTAssertEqual(self.sut.name, movieNameLabel)
    }
}
