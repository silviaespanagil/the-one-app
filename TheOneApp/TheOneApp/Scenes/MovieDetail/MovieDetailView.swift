//
//  MovieDetailView.swift
//  TheOneApp
//
//  Created by Silvia España on 17/12/21.
//

import SwiftUI

struct MovieDetailView: View {
    
    @StateObject var viewModel: MovieDetailViewModel
    
    var body: some View {
        
        VStack {
            
            GeometryReader { detailGeo in
                
                Color("AppDarkGreen")
                    .ignoresSafeArea()
                    .overlay(
                        
                        VStack {
                            
                            DetailIntroView(image: viewModel.movie.movieImage, name: viewModel.movie.name, width: detailGeo.size.width*0.85, height: 200)
                                .frame(height: detailGeo.size.height * 0.40, alignment: .bottom)
                            
                            VStack {
                                
                                Text("\("Released on ")\(String(viewModel.movie.releaseDate))")
                                    .foregroundColor(Color("AppDarkGreen"))
                                    .padding()
                                
                                DetailItemView(title: "Tomatometer", value: String(viewModel.movie.rottenTomatoesScore))
                                
                                DetailItemView(title: "Movie length:", value: "\(String(viewModel.movie.runtime))\(" minutes")")
                                
                                DetailItemView(title: "Budget:", value: "\(String(viewModel.movie.budget))\(" millions")")
                                
                                DetailItemView(title: "Boxoffice:", value: "\(String(viewModel.movie.revenue))\(" millions")")
                                
                                DetailItemView(title: "Academy Awards Nominations:", value: String(viewModel.movie.oscarNominations))
                                
                                DetailItemView(title: "Academy Awards Win:", value: String(viewModel.movie.oscarWins))
                            }
                            .frame(width: detailGeo.size.width * 1, height: detailGeo.size.height * 0.7, alignment: .top)
                            .background(Color("AppSalmon")).ignoresSafeArea()
                            .clipShape(RoundedRectangle(cornerRadius: 50))
                        }
                    )
            }
        }
    }
}


struct MovieDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let movie = Movie(id: "5cd95395de30eff6ebccde5c",
                          name: "The Fellowship of the Ring",
                          runtime: 178,
                          budget: 93,
                          revenue: 871.5,
                          oscarNominations: 13,
                          oscarWins: 4,
                          rottenTomatoesScore: 91,
                          movieImage: "https://images.mubicdn.net/images/film/1754/cache-47885-1563055256/image-w1280.jpg",
                          releaseDate: 2001)
        
        MovieDetailView(viewModel: MovieDetailViewModel(movie: movie))
    }
}
