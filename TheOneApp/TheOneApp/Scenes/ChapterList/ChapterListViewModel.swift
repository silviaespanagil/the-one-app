//
//  BookDetailViewModel.swift
//  TheOneApp
//
//  Created by Silvia España on 20/12/21.
//

import Foundation
import SwiftUI
import Combine

class ChapterListViewModel: ObservableObject {
    
    @Published public private(set) var chapters: [Chapter] = []
    
    @Published public private(set) var book: Book
    
    @Published public private(set) var showProgressView = false
    
    let chapterHeader: String
    
    private var cancellable: AnyCancellable?
    
    init(book: Book) {
        
        self.book = book
        chapterHeader = "Chapter"
    }
    
    // MARK: - Methods
    
    func getChaptersByBookId() {
        
        showProgressView = true
        
        cancellable = GetChaptersByBookUseCase().execute(id: book.id)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
                self.showProgressView = false
                
                switch completion {
                case .finished:
                    break
                case .failure:
                    break
                }
                
            }, receiveValue: { (chapters: [Chapter]) in

                self.chapters = chapters
            })
    }
}
