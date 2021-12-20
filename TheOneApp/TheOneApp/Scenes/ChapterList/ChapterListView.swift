//
//  BookDetailView.swift
//  TheOneApp
//
//  Created by Silvia España on 20/12/21.
//

import SwiftUI

struct ChapterListView: View {
    
    @StateObject var viewModel: ChapterListViewModel
    
    var body: some View {
        
        VStack {
            
            List {
                
                Section(header: Text(viewModel.chapterHeader).foregroundColor(Color("AppSalmon"))){
                    
                    if viewModel.showProgressView {
                        
                        LoadingAnimationView()
                            .listRowBackground(Color("AppSalmon"))
                    }
                    
                    ForEach(viewModel.chapters) { chapter in
                        
                        ChapterCellView(id: chapter.id,
                                        chapterName: chapter.chapterName)
                    }
                    
                }.listRowBackground(Color("AppSalmon"))
            }.onAppear {
                
                viewModel.getChaptersByBookId()
            }
        }.background(Color("AppDarkGreen").ignoresSafeArea())
    }
}
