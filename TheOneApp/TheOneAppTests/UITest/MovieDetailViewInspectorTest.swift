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
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        try super.tearDownWithError()
    }

    //Given
    
    let sut =  MovieDetailView(viewModel: MovieDetailViewModel(movie: Movie(id: "123", name: "The Fellowship of The Ring", runtime: 123, budget: 123, revenue: 123.0, oscarNominations: 123, oscarWins: 123, rottenTomatoesScore: 123.0, movieImage: "image", releaseDate: 2001)))
    
    func testDetailIntro() throws {
      
        let exp = sut.inspection.inspect { view in
            
            // When
            
            let detailIntro = try! view.vStack(0).geometryReader(0).color().overlay(0).vStack(0).view(DetailIntroView.self,0).vStack(0).text(1).string()
            
            // Then
            
            XCTAssertNotNil(detailIntro)
            XCTAssertEqual(self.sut.viewModel.movie.name, detailIntro)
        }
        ViewHosting.host(view: sut)
        wait(for: [exp], timeout: 2)
    }

    func testReleaseDate() throws {
   
        let exp = sut.inspection.inspect { view in
            
            // When
            let releaseDate = try! view.vStack(0).geometryReader(0).color().overlay(0).vStack(0).vStack(1).text(0).string()
            
            // Then
            XCTAssertNotNil(releaseDate)
            XCTAssertEqual("\("Released on ")\(String(self.sut.viewModel.movie.releaseDate))", releaseDate)
        }
        
        ViewHosting.host(view: sut)
        wait(for: [exp], timeout: 2)
    }
    
    func testTomatometerValue() throws {
        
        let exp = sut.inspection.inspect { view in
            
            // When
            
            let tomatometerValue = try! view.vStack(0).geometryReader(0).color().overlay(0).vStack(0).vStack(1).view(DetailItemView.self, 1).hStack(0).vStack(2).text(0).string()
            
            // Then
            
            XCTAssertNotNil(tomatometerValue)
            XCTAssertEqual(String(self.sut.viewModel.movie.rottenTomatoesScore), tomatometerValue)
        }
        
        ViewHosting.host(view: sut)
        wait(for: [exp], timeout: 2)
    }
    
    func testRuntimeValue() throws {
        
        let exp = sut.inspection.inspect { view in
            
            // When
            
            let runtimeValue = try! view.vStack(0).geometryReader(0).color().overlay(0).vStack(0).vStack(1).view(DetailItemView.self, 2).hStack(0).vStack(2).text(0).string()
            
            // Then
            
            XCTAssertNotNil(runtimeValue)
            XCTAssertEqual("\(String(self.sut.viewModel.movie.runtime))\(" minutes")", runtimeValue)
        }
        
        ViewHosting.host(view: sut)
        wait(for: [exp], timeout: 2)
    }
    
    func testBudgetValue() throws {
        
        let exp = sut.inspection.inspect { view in
            
            // When
            
            let budgetValue = try! view.vStack(0).geometryReader(0).color().overlay(0).vStack(0).vStack(1).view(DetailItemView.self, 3).hStack(0).vStack(2).text(0).string()
            
            // Then
            
            XCTAssertNotNil(budgetValue)
            XCTAssertEqual("\(String(self.sut.viewModel.movie.budget))\(" millions")", budgetValue)
        }
        
        ViewHosting.host(view: sut)
        wait(for: [exp], timeout: 2)
    }
    
    func testRevenueValue() throws {
        
        let exp = sut.inspection.inspect { view in
            
            // When
            
            let revenueValue = try! view.vStack(0).geometryReader(0).color().overlay(0).vStack(0).vStack(1).view(DetailItemView.self, 4).hStack(0).vStack(2).text(0).string()
            
            // Then
            
            XCTAssertNotNil(revenueValue)
            XCTAssertEqual("\(String(self.sut.viewModel.movie.revenue))\(" millions")", revenueValue)
        }
        
        ViewHosting.host(view: sut)
        wait(for: [exp], timeout: 2)
    }
    
    func testOscarNominationValue() throws {
        
        let exp = sut.inspection.inspect { view in
            
            // When
            
            let oscarNominationsValue = try! view.vStack(0).geometryReader(0).color().overlay(0).vStack(0).vStack(1).view(DetailItemView.self, 5).hStack(0).vStack(2).text(0).string()
            
            // Then
            
            XCTAssertNotNil(oscarNominationsValue)
            XCTAssertEqual(String(self.sut.viewModel.movie.oscarNominations), oscarNominationsValue)
        }
        
        ViewHosting.host(view: sut)
        wait(for: [exp], timeout: 2)
    }

    func testOscarWinsValue() throws {
        
        let exp = sut.inspection.inspect { view in
            
            // When
            
            let oscarWinsValue = try! view.vStack(0).geometryReader(0).color().overlay(0).vStack(0).vStack(1).view(DetailItemView.self, 6).hStack(0).vStack(2).text(0).string()
            
            // Then
            
            XCTAssertNotNil(oscarWinsValue)
            XCTAssertEqual(String(self.sut.viewModel.movie.oscarWins), oscarWinsValue)
        }
        
        ViewHosting.host(view: sut)
        wait(for: [exp], timeout: 2)
    }
}
