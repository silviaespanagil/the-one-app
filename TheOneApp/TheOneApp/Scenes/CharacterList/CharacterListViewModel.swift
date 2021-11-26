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
    
    @Published public private(set) var characters: [Character] = []
    
    @Published public private(set) var showProgressView = false
    
    private var cancellable: AnyCancellable?
    
    init() {
        getAllCharacters()
    }
    
    // MARK: - Methods
    
    func getAllCharacters() {
        
        showProgressView = true
        
        cancellable = GetAllCharactersUseCase().execute()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [self] completion in
                
                self.showProgressView = false
                
                switch completion {
                case .finished:
                    break
                    
                case .failure:
                    break
                }
                
            }, receiveValue: {(characters: [Character]) in
                
                self.characters = characters
            })
    }
}
