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
    
    @Published public private(set) var sortCharacters = ["Sort by", "A-Z", "Z-A"]
    
    @Published public private(set) var characters: [Character] = []
    
    @Published public private(set) var showProgressView = false
    
    var currentPage = 1
    
    private var cancellable: AnyCancellable?
    
    // MARK: - Methods
    
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
                
                self.originalCharacters.append(contentsOf: characters)
                self.characters.append(contentsOf: characters)
            })
    }
   
    func sortByAbc(_ selection: Int) {
        
        if selection == sortCharacters.count {
            
            // All values
            self.characters = self.originalCharacters
            
        } else if selection == 1 {
            
            self.characters = self.originalCharacters.sorted { $0.name < $1.name }
        }  //TODO: Check with Xavi .reverse() or other options
        
        /*else if selection == 2 {
            
            self.characters = self.originalCharacters.sorted { $0.name > $1.name }
        }*/
    }
}
