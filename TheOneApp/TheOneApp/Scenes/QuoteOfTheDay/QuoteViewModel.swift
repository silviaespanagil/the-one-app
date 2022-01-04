//
//  QuoteViewModel.swift
//  TheOneApp
//
//  Created by Silvia España on 21/12/21.
//

import Foundation
import SwiftUI
import Combine

class QuoteViewModel: ObservableObject {
    
    @Published public private(set) var quotes: [Quote] = []

    @Published public private(set) var showProgressView = false
    
    var dialogQuote: String = ""
    
    private var cancellable: AnyCancellable?
    
    // MARK: - Methods
    
    func getAllQuotes() {
        
        showProgressView = true
        
        cancellable = GetAllQuotesUseCase().execute()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
                self.showProgressView = false
                
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
        
        let randomIndexNumber = Int.random(in: 1..<quotes.count)
        
        dialogQuote = quotes[randomIndexNumber].dialog.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if dialogQuote.isEmpty {
            
            getQuote()
        }
    }
}
