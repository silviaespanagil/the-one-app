//
//  MovieListView.swift
//  TheOneApp
//
//  Created by Silvia España on 16/12/21.
//

import SwiftUI

struct MovieListView: View {
    
    @StateObject var viewModel: MovieListViewModel
    
    var body: some View {
        
        ScrollView {
            
            if viewModel.showProgressView {
                
                LoadingAnimationView()
            }
            
            LazyVGrid(columns: viewModel.columns, spacing: viewModel.spacing) {
                
                ForEach(viewModel.movies) { movie in
                    
                    if movie.name != viewModel.lotrSeries && movie.name != viewModel.hobbitSeries {
                        
                        NavigationLink(destination: MovieDetailView(viewModel: MovieDetailViewModel(movie: movie))) {
                            MovieCellView(name: movie.name, image: movie.movieImage)}
                    }
                }
            }.padding(.horizontal)
            
        }.onAppear {
            
            if viewModel.movies.isEmpty {
                
                viewModel.getAllMovies()
            }
        }.background(viewModel.backgroundColor.ignoresSafeArea())
    }
}


struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(viewModel: MovieListViewModel())
    }
}
