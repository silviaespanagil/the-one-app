//
//  MovieDetailViewModel.swift
//  TheOneApp
//
//  Created by Silvia España on 17/12/21.
//

import Foundation
import Combine
import SwiftUI

class MovieDetailViewModel: ObservableObject {
    
    @Published public private(set) var movie: Movie
    @Published public private(set) var showProgressView = false
    
    let release: String
    let tomatometer: String
    let runtime: String
    let budget: String
    let revenue: String
    let oscarNomination: String
    let oscarWin: String
    
    private var cancellable: AnyCancellable?
    
    // MARK: - Methods
    
    init(movie: Movie) {
        
        self.movie = movie
        release = "Released on "
        tomatometer = "Tomatometer:"
        runtime = "Movie length:"
        budget = "Budget:"
        revenue = "Boxoffice:"
        oscarNomination = "Academy Awards Nominations:"
        oscarWin = "Academy Awards Wins:"
        
        
    }
    
    func getMovieDetail() {
        
        showProgressView = true
        
        cancellable = GetMovieDetailUseCase().execute(id: movie.id)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
                self.showProgressView = false
                
                switch completion {
                case .finished:
                    break
                case .failure:
                    break
                }
                
            }, receiveValue: { (movie: Movie) in
                
                self.movie = movie
            })
    }
}
