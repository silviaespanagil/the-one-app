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
                            
                            DetailIntroView(image: viewModel.movie.movieImage, name: viewModel.movie.name, width: detailGeo.size.width*0.85, height: viewModel.height).tag("movieIntro")
                                .frame(height: detailGeo.size.height * 0.40, alignment: .bottom)
                            
                            VStack {
                                
                                Text("\(viewModel.release)\(String(viewModel.movie.releaseDate))").tag("releaseDate")
                                    .foregroundColor(Color("AppDarkGreen"))
                                    .padding()
                                
                                DetailItemView(title: viewModel.tomatometer, value: String(viewModel.movie.rottenTomatoesScore))
                                    .tag("tomatometer")
                                
                                DetailItemView(title: viewModel.runtime, value: "\(String(viewModel.movie.runtime))\(" minutes")")
                                    .tag("runtime")
                                
                                DetailItemView(title: viewModel.budget, value: "\(String(viewModel.movie.budget))\(" millions")")
                                    .tag("budget")
                                
                                DetailItemView(title: viewModel.revenue, value: "\(String(viewModel.movie.revenue))\(" millions")")
                                    .tag("revenue")
                                
                                DetailItemView(title: viewModel.oscarNomination, value: String(viewModel.movie.oscarNominations))
                                    .tag("oscarNomination")
                                
                                DetailItemView(title: viewModel.oscarWin, value: String(viewModel.movie.oscarWins))
                                    .tag("oscarWins")
                                
                                if viewModel.showQuote {
                                    
                                    Spacer()
                                    
                                    QuoteItemView(quote: viewModel.dialogQuote, colour: Color("AppDarkGreen"), font: .body)
                                        .padding(.bottom)
                                }
                            }
                            .frame(width: detailGeo.size.width * 1, height: detailGeo.size.height * 0.7, alignment: .top)
                            .background(Color("AppSalmon")).ignoresSafeArea()
                            .clipShape(RoundedRectangle(cornerRadius: viewModel.cornerRadius))
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
