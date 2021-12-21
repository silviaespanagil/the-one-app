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
    
    @Published public private(set) var quotes: [Quote] = []
    
    @Published public private(set) var showProgressView = false
    
    @Published public private(set) var showQuote = false
    
    var dialogQuote: String = ""
    
    let release: String
    let tomatometer: String
    let runtime: String
    let budget: String
    let revenue: String
    let oscarNomination: String
    let oscarWin: String
    
    let cornerRadius: CGFloat
    let height: CGFloat
    
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
        
        cornerRadius = 50
        height = 200
        
        getMovieQuote()
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
    
    func getMovieQuote() {
        
        cancellable = GetMovieQuotesUseCase().execute(id: movie.id)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .finished:
                    break
                case .failure:
                    break
                }
                
            }, receiveValue: { (quotes: [Quote]) in
                
                self.quotes = quotes
                self.getQuote()
            })
    }
    
    func getQuote() {
        
        let quotesSize = quotes.count
        
        if quotesSize > 0 {
            
            showQuote = true
            
            let randomIndexNumber = Int.random(in: 1..<quotesSize)
            
            dialogQuote = quotes[randomIndexNumber].dialog.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if dialogQuote.isEmpty {
                
                getQuote()
            }
        }
    }
}
