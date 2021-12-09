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
                
                self.characters.append(contentsOf: characters)
            })
    }
   
}
