//
//  CharacterListView.swift
//  TheOneApp
//
//  Created by Silvia España on 26/11/21.
//

import SwiftUI

struct CharacterListView: View {
    
    @StateObject var viewModel: CharacterListViewModel
    
    var body: some View {
        VStack {
            ForEach(viewModel.characters) { character in
                VStack() {
                    
                    Text(character.name)
                    Text("Iluvatar ayudame")
                }
                .onAppear {
                    
                    if character == viewModel.characters.last {
                        
                        viewModel.getAllCharacters(page: viewModel.currentPage)
                    }
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
