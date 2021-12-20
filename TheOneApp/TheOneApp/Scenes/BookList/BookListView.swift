//
//  BookListView.swift
//  TheOneApp
//
//  Created by Silvia España on 20/12/21.
//

import SwiftUI

struct BookListView: View {
    
    @StateObject var viewModel: BookListViewModel
    
    var body: some View {
        
        VStack {
            
            GeometryReader { bookGeo in
                
                List {
                    
                    ForEach(viewModel.books) { book in
                        
                        NavigationLink(destination:ChapterListView(viewModel: ChapterListViewModel(book: book))) {
                            
                            Text("")
                        }.listRowBackground(Image("")
                                                .renderImage(url: URL(string: book.bookImage)!)
                                                .scaledToFit())
                    }
                }
                .onAppear {
                    viewModel.getAllBooks()
                }.environment(\.defaultMinListRowHeight, bookGeo.size.height * 0.25 )
            }
            
            Text(viewModel.coverCredit)
                .font(.footnote)
                .foregroundColor(Color("AppSalmon"))
                .padding()
        }.background(Color("AppDarkGreen")).ignoresSafeArea()}
}


struct BookListView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        BookListView(viewModel: BookListViewModel())
    }
}
