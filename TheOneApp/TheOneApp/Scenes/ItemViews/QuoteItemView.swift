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
    
    init(quote: String) {
        
        self.image = "quote.bubble"
        self.quote = quote
    }
    
    var body: some View {
        
        VStack {

            Image(systemName: image)
            
            Text("\"\(quote)\"")
                .font(.title).padding()
        }.foregroundColor(Color("AppSalmon"))
    }
}

