//
//  MainView.swift
//  TheOneApp
//
//  Created by Silvia España on 14/12/21.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel: MainViewModel
    
    var body: some View {
        
            NavigationView {
                
                GeometryReader { listHeight in
                    
                List {

                    NavigationLink(destination: CharacterListView(viewModel: CharacterListViewModel())) {

                        MainCellView(name: viewModel.mainTitles[0])
                    } .listRowBackground(ImageItemView(image: viewModel.mainImages[0]))
                    
                    NavigationLink(destination: MovieListView(viewModel: MovieListViewModel())) {

                        MainCellView(name: viewModel.mainTitles[1])
                    } .listRowBackground(ImageItemView(image: viewModel.mainImages[1]))
                    
                    NavigationLink(destination: BookListView(viewModel: BookListViewModel())) {

                        MainCellView(name: viewModel.mainTitles[2])
                    } .listRowBackground(ImageItemView(image: viewModel.mainImages[2]))
                    
                    NavigationLink(destination: QuoteView(viewModel: QuoteViewModel())) {

                        MainCellView(name: viewModel.mainTitles[3])
                    } .listRowBackground(ImageItemView(image: viewModel.mainImages[3]))
                }
                .background(Color("AppDarkGreen").ignoresSafeArea())
                .onAppear {

                    UITableView.appearance().backgroundColor = .clear
                }.environment(\.defaultMinListRowHeight, listHeight.size.height * 0.22)
            }
        }.accentColor(Color("AppSalmon"))
    }
}

struct MainView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        MainView(viewModel: MainViewModel())
    }
}
