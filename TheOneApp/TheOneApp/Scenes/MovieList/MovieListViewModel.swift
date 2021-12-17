//
//  MovieListViewModel.swift
//  TheOneApp
//
//  Created by Silvia España on 16/12/21.
//

import Foundation
import SwiftUI
import Combine

class MovieListViewModel: ObservableObject {
    
    private var originalMovies: [Movie] = []
    
    @Published public private(set) var movies: [Movie] = []
    
    @Published public private(set) var showProgressView = false
    
    let lotrSeries: String
    let hobbitSeries: String
    let spacing: CGFloat
    let backgroundColor: Color
    
    let columns = [GridItem(.flexible()),
                   GridItem(.flexible())]
    
    private var cancellable: AnyCancellable?
    
    init() {
        
        lotrSeries = "The Lord of the Rings Series"
        hobbitSeries = "The Hobbit Series"
        spacing = 20
        backgroundColor = Color("AppDarkGreen")
    }
    
    // MARK: - Methods
    
    func sortMovies() {
        
        movies = originalMovies.sorted { $0.releaseDate < $1.releaseDate }
        originalMovies = movies
    }
    
    func getAllMovies() {
        
        showProgressView = true
        
        cancellable = GetAllMoviesUseCase().execute()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [self] completion in
                
                self.showProgressView = false
                
                switch completion {
                case .finished:
                    break
                    
                case .failure:
                    break
                }
                
            }, receiveValue: { (movies: [Movie] ) in
                
                self.movies = movies
                self.originalMovies = movies
                self.sortMovies()
            })
    }
}
