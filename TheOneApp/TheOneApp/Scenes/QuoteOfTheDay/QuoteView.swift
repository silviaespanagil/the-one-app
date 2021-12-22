//
//  QuoteView.swift
//  TheOneApp
//
//  Created by Silvia España on 21/12/21.
//

import SwiftUI

struct QuoteView: View {
    
    @StateObject var viewModel: QuoteViewModel
    
    internal let inspection = Inspection<Self>()
    
    var body: some View {
        
        VStack {
            
            Color("AppDarkGreen")
                .ignoresSafeArea()
                .overlay(
                    
                    QuoteItemView(quote: "\(viewModel.dialogQuote)", colour: Color("AppSalmon"), font: .title)
                )
        } .onAppear {
            
            viewModel.getAllQuotes()
        }
        .onReceive(inspection.notice) {
            
            self.inspection.visit(self, $0)
        }
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView(viewModel: QuoteViewModel())
    }
}
