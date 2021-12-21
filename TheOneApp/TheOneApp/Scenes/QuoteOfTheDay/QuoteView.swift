//
//  QuoteView.swift
//  TheOneApp
//
//  Created by Silvia España on 21/12/21.
//

import SwiftUI

struct QuoteView: View {
    
    @StateObject var viewModel: QuoteViewModel
    
    var body: some View {
        
        VStack {
            
            Color("AppDarkGreen")
                .ignoresSafeArea()
                .overlay(
                    
                    QuoteItemView(quote: "\(viewModel.dialogQuote)")
                )
        } .onAppear {
            
            viewModel.getAllQuotes()
        }
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView(viewModel: QuoteViewModel())
    }
}
