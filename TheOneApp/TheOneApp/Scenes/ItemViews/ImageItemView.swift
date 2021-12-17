//
//  ImageItemView.swift
//  TheOneApp
//
//  Created by Silvia España on 16/12/21.
//

import SwiftUI

struct ImageItemView: View {
    
    var image: String
    var overlayColor = Color("AppDarkGreen")
    
    init(image: String) {
        
        self.image = image
    }
    
    var body: some View {
        
        Image("")
            .renderImage(url: URL(string: image)!)
            .overlay(overlayColor).opacity(0.5)
    }
}

