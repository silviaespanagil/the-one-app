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
                    } .listRowBackground(Image("")
                                            .renderImage(url: URL(string: viewModel.mainImages[0])!)
                                            .overlay(Color("launchScreen-background").opacity(0.5)))
                    
                    NavigationLink(destination: MainView(viewModel: MainViewModel())) {

                        MainCellView(name: viewModel.mainTitles[1])
                    } .listRowBackground(Image("")
                                            .renderImage(url: URL(string: viewModel.mainImages[1])!)
                                            .overlay(Color("launchScreen-background").opacity(0.5)))
                    
                    NavigationLink(destination: MainView(viewModel: MainViewModel())) {

                        MainCellView(name: viewModel.mainTitles[2])
                    } .listRowBackground(Image("")
                                            .renderImage(url: URL(string: viewModel.mainImages[2])!)
                                            .overlay(Color("launchScreen-background").opacity(0.5)))
                    
                    NavigationLink(destination: MainView(viewModel: MainViewModel())) {

                        MainCellView(name: viewModel.mainTitles[3])
                    } .listRowBackground(Image("")
                                            .renderImage(url: URL(string: viewModel.mainImages[3])!)
                                            .overlay(Color("launchScreen-background").opacity(0.5)))
                }
                .background(Color("launchScreen-background").ignoresSafeArea())
                .onAppear {

                    UITableView.appearance().backgroundColor = .clear
                }.environment(\.defaultMinListRowHeight, listHeight.size.height * 0.22)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        MainView(viewModel: MainViewModel())
    }
}
