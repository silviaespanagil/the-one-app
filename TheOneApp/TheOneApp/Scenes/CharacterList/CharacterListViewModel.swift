//
//  CharacterListViewModel.swift
//  TheOneApp
//
//  Created by Silvia España on 26/11/21.
//

import Foundation
import SwiftUI
import Combine

class CharacterListViewModel: ObservableObject {
    
    private var originalCharacters: [Character] = []
    
    @Published public private(set) var characters: [Character] = []
    
    @Published public private(set) var showProgressView = false
    
    var currentPage = 1
    
    private var cancellable: AnyCancellable?
    
    // MARK: - Methods
    
    func sortCharacters() {
        
        characters = originalCharacters.sorted { $0.name < $1.name }
        originalCharacters = characters
    }
    
    func getAllCharacters(page: Int) {
        
        showProgressView = true
        
        cancellable = GetAllCharactersUseCase().execute(page: page)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [self] completion in
                
                self.showProgressView = false
                
                switch completion {
                case .finished:
                    self.currentPage += 1
                    break
                    
                case .failure:
                    break
                }
                
            }, receiveValue: { (characters: [Character] ) in
                
                self.characters.append(contentsOf: characters)
                self.originalCharacters.append(contentsOf: self.characters)
                self.sortCharacters()
            })
    }
    
    func sortByRace(_ selection: String) {
        
        if selection == Race.AllRaces.description {
            
            self.characters = self.originalCharacters
            
        } else {
            
            self.characters = self.originalCharacters.filter { character in
                
                character.race!.description == selection
            }
        }
    }
}
