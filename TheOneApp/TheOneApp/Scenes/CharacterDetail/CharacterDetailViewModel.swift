//
//  CharacterDetailViewModel.swift
//  TheOneApp
//
//  Created by Silvia España on 13/12/21.
//

import Foundation
import Combine
import SwiftUI

class CharacterDetailViewModel: ObservableObject {
    
    @Published public private(set) var character: Character
    @Published public private(set) var showProgressView = false
    
    let born: String
    let death: String
    let partner: String
    let moreInfo: String
    let unknownRace: String
    
    let cornerRadius: CGFloat = 25
    let imageSize: CGFloat = 200
    let paddingSize: CGFloat = 15

    private var cancellable: AnyCancellable?
    
    // MARK: - Methods
    
    init(character: Character) {
        
        self.character = character
        born = "Born in"
        death = "Registered death"
        partner = "Got married with"
        moreInfo = "Want to know more about "
        unknownRace = "Unknown race"
    }
    
    func getCharacterDetail() {
        
        showProgressView = true
        
        cancellable = GetCharacterDetailUseCase().execute(id: character.id)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
                self.showProgressView = false
                
                switch completion {
                case .finished:
                    break
                case .failure:
                    break
                }
                
            }, receiveValue: { (character: Character) in
                
                self.character = character
            })
    }
}
