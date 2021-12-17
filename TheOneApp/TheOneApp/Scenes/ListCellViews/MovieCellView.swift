//
//  MovieCellView.swift
//  TheOneApp
//
//  Created by Silvia España on 17/12/21.
//

import SwiftUI

struct MovieCellView: View {
    
    var name: String
    var image: String
    
    init(name: String, image: String) {
        
        self.name = name
        self.image = image
    }
    
    var body: some View {
        
        VStack {
            Image("").renderImage(url: URL(string: image)!)
            .frame(maxHeight: 150)
            .shadow(color: Color("AppMediumGreen"), radius: 3, x: 3, y: 0)
            .overlay(Color("AppMediumGreen")).opacity(0.5)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .overlay(Text(name)
                        .font(.subheadline)
                        .foregroundColor(Color("AppWhite"))
                        .fontWeight(.bold)
                        .tracking(5)
                        .textCase(.uppercase)
                        .padding()
                        )
        }
    }
}


