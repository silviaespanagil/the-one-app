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
            Text("HOLA")
            ForEach(viewModel.characters) { character in
                Text(character.name)
                
            }
            
        }
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView(viewModel: CharacterListViewModel())
    }
}
