//
//  CharacterListView.swift
//  TheOneApp
//
//  Created by Silvia España on 26/11/21.
//

import SwiftUI

struct CharacterListView: View {
    
    @StateObject var viewModel: CharacterListViewModel
    @State private var selection = "All races"
    
    var body: some View {
        
        VStack {
            
            if !viewModel.showProgressView {
                
                VStack() {
                    
                    HStack() {
                        
                        Spacer()
                        
                        Picker("Filter by Race", selection: $selection) {
                            
                            ForEach (Race.uniqueDescriptions, id: \.self, content: { race in
                                
                                Text(race)
                                    .tag(race)
                            })
                        }.onChange(of: selection) { _ in
                            
                            viewModel.sortByRace(selection)
                        }
                    } .padding(.trailing)
                }
            }
            
            List {
                
                if viewModel.showProgressView {
                    
                    ProgressViewView()
                }
                
                ForEach(viewModel.characters) { character in
                    
                    NavigationLink(destination: CharacterDetailView(viewModel: CharacterDetailViewModel(character: character))) {
                        
                        CharacterCellView(id: character.id, race: character.getRace(), name: character.name , image: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Blason_Gondor.svg/1862px-Blason_Gondor.svg.png")}
                }
            }
        }
        .onAppear {
            
            if viewModel.characters.isEmpty {
                
                viewModel.getAllCharacters(page: 1)
            }
        }
    }
}

struct CharacterListView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        CharacterListView(viewModel: CharacterListViewModel())
    }
}
