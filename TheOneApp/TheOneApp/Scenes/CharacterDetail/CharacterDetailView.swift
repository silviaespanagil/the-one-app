//
//  CharacterDetailView.swift
//  TheOneApp
//
//  Created by Silvia España on 13/12/21.
//

import SwiftUI

struct CharacterDetailView: View {
    
    @StateObject var viewModel: CharacterDetailViewModel
    
    var body: some View {
        
        VStack {
            
            GeometryReader { detailGeo in
                
                Color("AppDarkGreen")
                    .ignoresSafeArea()
                    .overlay(
                        
                        VStack {
                            
                            DetailIntroView(image: viewModel.character.imageRace, name: viewModel.character.name, width: viewModel.imageSize, height: viewModel.imageSize)
                                .frame(height: detailGeo.size.height * 0.40, alignment: .bottom)
                            
                            VStack {
                                
                                Text(viewModel.character.race?.description ?? viewModel.unknownRace)
                                    .foregroundColor(Color("AppDarkGreen"))
                                    .padding()
                                
                                DetailItemView(title: viewModel.born, value: viewModel.character.birth)
                                
                                DetailItemView(title: viewModel.death, value: viewModel.character.death)
                                
                                DetailItemView(title: viewModel.partner, value: viewModel.character.spouse)

                                if let wikiURL = viewModel.character.wikiURL, !wikiURL.isEmpty {
                                    HStack {
                                        
                                        Text("\(viewModel.moreInfo) \(viewModel.character.name)?")
                                            .font(.footnote)
                                        
                                        Spacer()
                                        
                                        VStack {
                                            
                                            Link("See the wiki", destination: URL(string: wikiURL)!)
                                                .foregroundColor(Color("AppDarkGreen"))
                                        }
                                    }.padding(EdgeInsets(top: 0, leading: viewModel.paddingSize, bottom: viewModel.paddingSize, trailing: viewModel.paddingSize))
                                }
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

struct CharacterDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let character = Character(id: "5cd99d4bde30eff6ebccfc07",
                                  height: "",
                                  race: nil,
                                  gender: "Female",
                                  birth: "TA 241",
                                  spouse: "Aragorn II Elessar",
                                  death: "FO 121",
                                  realm: "Reunited Kingdom",
                                  hair: "Black",
                                  name: "Arwen",
                                  wikiURL: "",
                                  imageRace: "https://www.hobbitontours.com/media/1518/hobbiton_nov-2019-sjp-346.jpg?anchor=center&mode=crop&width=1272&height=716&rnd=132732401780000000")
        
        CharacterDetailView(viewModel: CharacterDetailViewModel(character: character))
    }
}
