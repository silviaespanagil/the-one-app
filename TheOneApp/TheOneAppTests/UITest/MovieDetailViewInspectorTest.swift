//
//  MovieDetailViewInspectorTest.swift
//  TheOneAppTests
//
//  Created by Silvia España on 23/12/21.
//

@testable import TheOneApp
import XCTest
import ViewInspector
import SwiftUI

extension MovieDetailView: Inspectable { }
extension DetailItemView: Inspectable { }
extension DetailIntroView: Inspectable { }

class MovieDetailViewInspectorTest: XCTestCase {
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        
        try super.tearDownWithError()
    }
    
    // Given
    let sut =  MovieDetailView(viewModel: MovieDetailViewModel(movie: Movie(id: "123", name: "The Fellowship of The Ring", runtime: 123, budget: 123, revenue: 123, oscarNominations: 123, oscarWins: 123, rottenTomatoesScore: 123, movieImage: "image", releaseDate: 2001)))
    
    func testDetailMovieIntro() throws {
        
        // When
        let tag = "detailIntroText"
        let detailIntro = try sut.inspect().find(viewWithTag: tag).text().string()
        
        // Then
        XCTAssertNotNil(detailIntro)
        XCTAssertEqual(self.sut.viewModel.movie.name, detailIntro)
    }
    
    func testReleaseDate() throws {
        
        // When
        let tag = "releaseDate"
        let releaseDate = try sut.inspect().find(viewWithTag: tag).text().string()
        
        // Then
        XCTAssertNotNil(releaseDate)
        XCTAssertEqual("\("Released on ")\(String(self.sut.viewModel.movie.releaseDate))", releaseDate)
    }
    
    func testTomatomerValue() throws {

        // When
        let infoTag = "tomatometer"
        let detailTag = "movieInfoDetail"
        let movieInfoDetail = try! self.sut.inspect().find(viewWithTag: infoTag).find(viewWithTag: detailTag).text().string()

        // Then
        XCTAssertNotNil(movieInfoDetail)
        XCTAssertEqual(String(self.sut.viewModel.movie.rottenTomatoesScore), movieInfoDetail)
    }

    func testRuntimeValue() throws {

        // When
        let infoTag = "runtime"
        let detailTag = "movieInfoDetail"
        let runtimeValue = try! sut.inspect().find(viewWithTag: infoTag).find(viewWithTag: detailTag).text().string()

        // Then
        XCTAssertNotNil(runtimeValue)
        XCTAssertEqual("\(String(self.sut.viewModel.movie.runtime))\(" minutes")", runtimeValue)
    }
    
    func testBudgetValue() throws {
        
        // When
        let infoTag = "budget"
        let detailTag = "movieInfoDetail"
        let budgetValue = try! sut.inspect().find(viewWithTag: infoTag).find(viewWithTag: detailTag).text().string()
        
        // Then
        XCTAssertNotNil(budgetValue)
        XCTAssertEqual("\(String(self.sut.viewModel.movie.budget))\(" millions")", budgetValue)
    }

    func testRevenueValue() throws {

        // When
        let infoTag = "revenue"
        let detailTag = "movieInfoDetail"
        let revenueValue = try! sut.inspect().find(viewWithTag: infoTag).find(viewWithTag: detailTag).text().string()

        // Then
        XCTAssertNotNil(revenueValue)
        XCTAssertEqual("\(String(self.sut.viewModel.movie.revenue))\(" millions")", revenueValue)
    }

    func testOscarNominationValue() throws {

        // When
        let infoTag = "oscarNomination"
        let detailTag = "movieInfoDetail"
        let oscarNominationsValue = try! sut.inspect().find(viewWithTag: infoTag).find(viewWithTag: detailTag).text().string()

        // Then
        XCTAssertNotNil(oscarNominationsValue)
        XCTAssertEqual(String(self.sut.viewModel.movie.oscarNominations), oscarNominationsValue)
    }

    func testOscarWinsValue() throws {

        // When
        let infoTag = "oscarWins"
        let detailTag = "movieInfoDetail"
        let oscarWinsValue = try! sut.inspect().find(viewWithTag: infoTag).find(viewWithTag: detailTag).text().string()

        // Then
        XCTAssertNotNil(oscarWinsValue)
        XCTAssertEqual(String(self.sut.viewModel.movie.oscarWins), oscarWinsValue)
    }
}
