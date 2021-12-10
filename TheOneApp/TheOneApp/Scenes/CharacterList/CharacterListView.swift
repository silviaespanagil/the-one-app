//
//  CharacterListView.swift
//  TheOneApp
//
//  Created by Silvia España on 26/11/21.
//

import SwiftUI

struct CharacterListView: View {
    
    @StateObject var viewModel: CharacterListViewModel
    @State private var selection = 0
    @State private var raceSelection = "All races"
    
    var body: some View {
        
        VStack {
            
            if !viewModel.showProgressView {
                
                VStack() {
                    
                    HStack() {
                        
                        Spacer()
                        
                        Picker(selection: $selection, label: Text("Sort by")) {
                            
                            ForEach(0 ..< viewModel.sortCharacters.count, content: { index in
                                
                                Text(self.viewModel.sortCharacters[index])
                                    .tag(index)
                            })
                            
                        }.onChange(of: selection) { _ in
                            
                            viewModel.sortByAbc(selection)
                        }
                        
                        Spacer()
                        
                        Picker("Filter by Race", selection: $raceSelection) {
                            
                            ForEach (viewModel.allRaces, id: \.self, content: { race in
                                
                                Text(race)
                                    .tag(race)
                            })
                            
                            }.onChange(of: raceSelection) { _ in
                                
                                viewModel.sortByRace(raceSelection)
                        }
                        
                        Spacer()
//                        TODO: Ask Xavi if there's a way to clean duplicates from here or if new way is better
//                        Picker("Filter by Race", selection: $raceSelection) {
//
//                            ForEach (Race.allCases, id: \.self, content: { race in
//
//                                Text(race.description)
//                                    .tag(race.description)
//                            })
//                        }
                    }
                }
            }
            
            List {
                
                if viewModel.showProgressView {
                    
                    ProgressViewView()
                }
                
                ForEach(viewModel.characters) { character in
                    
                    CharacterCellView(id: character.id, race: character.getRace(), name: character.name , image: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Blason_Gondor.svg/1862px-Blason_Gondor.svg.png")
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
