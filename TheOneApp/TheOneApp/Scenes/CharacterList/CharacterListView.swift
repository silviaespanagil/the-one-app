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
            
            List {
                
                if viewModel.showProgressView {
                    
                    ProgressViewView()
                }
                
                ForEach(viewModel.characters) { character in
                    
                    CharacterCellView(id: character.id, race: character.race ?? "", name: character.name ?? "", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Blason_Gondor.svg/1862px-Blason_Gondor.svg.png")
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
