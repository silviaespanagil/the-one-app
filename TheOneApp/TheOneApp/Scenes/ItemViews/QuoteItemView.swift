//
//  QuoteItemView.swift
//  TheOneApp
//
//  Created by Silvia España on 21/12/21.
//

import SwiftUI

struct QuoteItemView: View {
    
    var image: String
    var quote: String
    var colour: Color
    var font: Font
    
    init(quote: String, colour: Color, font: Font) {
        
        self.image = "quote.bubble"
        self.quote = quote
        self.colour = colour
        self.font = font
    }
    
    var body: some View {
        
        VStack {

            Image(systemName: image)
            
            Text("\"\(quote)\"")
                .font(font)
                .italic()
                .padding()
        }.foregroundColor(colour)
    }
}

