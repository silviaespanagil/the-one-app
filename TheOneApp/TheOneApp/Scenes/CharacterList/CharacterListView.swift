//
//  CharacterListView.swift
//  TheOneApp
//
//  Created by Silvia España on 26/11/21.
//

import SwiftUI
import Combine

struct CharacterListView: View {
    
    @StateObject var viewModel: CharacterListViewModel
    @State private var selection = "All races"
    
    // Test var
    internal let inspection = Inspection<Self>()
    var didAppear: ((Self) -> Void)?
    
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
                        
                }.tag("RaceFilter")
            }
            
            List {
                
                if viewModel.showProgressView {
                    
                    LoadingAnimationView()
                        .listRowBackground(Color("AppSalmon"))
                }
                
                ForEach(viewModel.characters) { character in
                    
                    NavigationLink(destination: CharacterDetailView(viewModel: CharacterDetailViewModel(character: character))) {
                        
                        CharacterCellView(id: character.id, race: character.getRace(), name: character.name , image: character.imageRace)
                    }
                }.listRowBackground(Color("AppSalmon"))
            }
        }.tag("CharacterListWrapper")
            .onReceive(inspection.notice) {self.inspection.visit(self, $0)}
        .onAppear {
            
            if viewModel.characters.isEmpty {
                
                viewModel.getAllCharacters(page: 1)
                self.didAppear?(self)
            }
        }.background(Color("AppDarkGreen").ignoresSafeArea())
    }
}

struct CharacterListView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        CharacterListView(viewModel: CharacterListViewModel())
    }
}

internal final class Inspection<V> {

    let notice = PassthroughSubject<UInt, Never>()
    var callbacks = [UInt: (V) -> Void]()

    func visit(_ view: V, _ line: UInt) {
        if let callback = callbacks.removeValue(forKey: line) {
            callback(view)
        }
    }
}
