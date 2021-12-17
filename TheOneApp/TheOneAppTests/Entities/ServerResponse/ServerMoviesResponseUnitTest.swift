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
        
        // Givem
        
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
}
