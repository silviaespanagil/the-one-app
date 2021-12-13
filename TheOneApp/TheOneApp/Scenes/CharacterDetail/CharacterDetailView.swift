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
            
            Text(viewModel.character.name)
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
                                  wikiURL: "")
        
        CharacterDetailView(viewModel: CharacterDetailViewModel(character: character))
    }
}
