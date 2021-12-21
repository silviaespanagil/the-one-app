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
    
    @Published public private(set) var quotes: [Quote] = []
    
    @Published public private(set) var showProgressView = false
    
    @Published public private(set) var showQuote = false
    
    var dialogQuote: String = ""
    
    let born: String
    let death: String
    let partner: String
    let moreInfo: String
    let unknownRace: String
    
    let cornerRadius: CGFloat = 25
    let imageSize: CGFloat = 150
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
        
        getCharacterQuote()
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
                
            }, receiveValue: { [self] (character: Character) in
                
                self.character = character
            })
    }
    
    func getCharacterQuote() {
        
        cancellable = GetCharacterQuotesUseCase().execute(id: character.id)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .finished:
                    break
                case .failure:
                    break
                }
                
            }, receiveValue: { (quotes: [Quote]) in
                
                self.quotes = quotes
                self.getQuote()
            })
    }
    
    func getQuote() {
        
        let quotesSize = quotes.count
        
        if quotesSize > 0 {
            
            showQuote = true
            
            let randomIndexNumber = Int.random(in: 1..<quotesSize)
            
            dialogQuote = quotes[randomIndexNumber].dialog.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if dialogQuote.isEmpty {
                
                getQuote()
            }
        }
    }
}
