//
//  BookListViewModel.swift
//  TheOneApp
//
//  Created by Silvia España on 20/12/21.
//

import Foundation
import SwiftUI
import Combine

class BookListViewModel: ObservableObject {
    
    
    @Published public private(set) var books: [Book] = []
    
    @Published public private(set) var showProgressView = false
    
    let coverCredit: String
    
    private var cancellable: AnyCancellable?
    
    init() {
        
        coverCredit = "Covers designed by Christopher Moisan with illustrations by Johan Egerkrans"
    }
    
    // MARK: - Methods

    func getAllBooks() {
        
        showProgressView = true
        
        cancellable = GetAllBooksUseCase().execute()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [self] completion in
                
                self.showProgressView = false
                
                switch completion {
                case .finished:
                    break
                    
                case .failure:
                    break
                }
                
            }, receiveValue: { (books: [Book] ) in
                
                self.books = books
            })
    }
}
