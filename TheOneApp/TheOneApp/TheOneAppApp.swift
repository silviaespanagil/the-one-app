//
//  TheOneAppApp.swift
//  TheOneApp
//
//  Created by Silvia España on 25/11/21.
//

import SwiftUI

@main
struct TheOneAppApp: App {
    var body: some Scene {
        WindowGroup {
            CharacterListView(viewModel: CharacterListViewModel())
        }
    }
}
