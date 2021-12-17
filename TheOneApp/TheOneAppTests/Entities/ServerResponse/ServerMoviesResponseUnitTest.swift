//
//  ServerMovieResponseUnitTest.swift
//  TheOneAppTests
//
//  Created by Silvia España on 16/12/21.
//

import XCTest
@testable import TheOneApp

class ServerMoviesResponseUnitTest: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        try super.tearDownWithError()
    }
    
    func testConvertToEntity() throws {
        
        // Given
        
        let serverMoviesResponse = ServerMoviesResponse(_id: "5cd95395de30eff6ebccde56",
                                                        name: "The Lord of the Rings Series",
                                                        runtimeInMinutes: 558,
                                                        budgetInMillions: 281,
                                                        boxOfficeRevenueInMillions: 2917,
                                                        academyAwardNominations: 30,
                                                        academyAwardWins: 17,
                                                        rottenTomatoesScore: 94,
                                                        movieImage: "",
                                                        releaseDate: 0)
        
        // When
        let movie = serverMoviesResponse.convertToEntity()
        
        // Then
        XCTAssertNotNil(movie)
        XCTAssertEqual(movie.id, serverMoviesResponse._id)
        XCTAssertEqual(movie.name, serverMoviesResponse.name)
        XCTAssertEqual(movie.runtime, serverMoviesResponse.runtimeInMinutes)
        XCTAssertEqual(movie.budget, serverMoviesResponse.budgetInMillions)
        XCTAssertEqual(movie.revenue, serverMoviesResponse.boxOfficeRevenueInMillions)
        XCTAssertEqual(movie.oscarNominations, serverMoviesResponse.academyAwardNominations)
        XCTAssertEqual(movie.oscarWins, serverMoviesResponse.academyAwardWins)
        XCTAssertEqual(movie.rottenTomatoesScore, serverMoviesResponse.rottenTomatoesScore)
        
    }
    
    func testGetMovieImage() {
        
        // Given
        
        let movieImage = "https://images.mubicdn.net/images/film/1754/cache-47885-1563055256/image-w1280.jpg"
        let serverMoviesResponse = ServerMoviesResponse(_id: "5cd95395de30eff6ebccde5c",
                                                       name: "The Fellowship of the Ring",
                                                       runtimeInMinutes: 178,
                                                       budgetInMillions: 93,
                                                       boxOfficeRevenueInMillions: 871.5,
                                                       academyAwardNominations: 13,
                                                       academyAwardWins: 4,
                                                       rottenTomatoesScore: 91,
                                                       movieImage: "https://images.mubicdn.net/images/film/1754/cache-47885-1563055256/image-w1280.jpg",
                                                       releaseDate: 2001)
        
        // When
        let image = serverMoviesResponse.getMovieImage()
        
        // Then
        
        XCTAssertNotNil(image)
        XCTAssertEqual(image, movieImage)
    }
    
    func testGetReleaseDate() {
        
        // Given
        
        let date = 2001
        let serverMoviesResponse = ServerMoviesResponse(_id: "5cd95395de30eff6ebccde5c",
                                                       name: "The Fellowship of the Ring",
                                                       runtimeInMinutes: 178,
                                                       budgetInMillions: 93,
                                                       boxOfficeRevenueInMillions: 871.5,
                                                       academyAwardNominations: 13,
                                                       academyAwardWins: 4,
                                                       rottenTomatoesScore: 91,
                                                       movieImage: "https://images.mubicdn.net/images/film/1754/cache-47885-1563055256/image-w1280.jpg",
                                                       releaseDate: 2001)
        
        // When
        let releaseDate = serverMoviesResponse.getReleaseDate()
        
        // Then
        
        XCTAssertNotNil(releaseDate)
        XCTAssertEqual(date, releaseDate)
    }
    
    func testEditMovieName() {
        
        // Given
        
        let checkedName = "An Unexpected Journey"
        let serverMoviesResponse = ServerMoviesResponse(_id: "5cd95395de30eff6ebccde58",
                                                       name: "The Unexpected Journey",
                                                       runtimeInMinutes: 169,
                                                       budgetInMillions: 200,
                                                       boxOfficeRevenueInMillions: 1021,
                                                       academyAwardNominations: 3,
                                                       academyAwardWins: 1,
                                                       rottenTomatoesScore: 64,
                                                       movieImage: "",
                                                       releaseDate: 2012)
        
        // When
        let name = serverMoviesResponse.editMovieName()
        
        // Then
        
        XCTAssertNotNil(name)
        XCTAssertEqual(checkedName, name)
    }
}
