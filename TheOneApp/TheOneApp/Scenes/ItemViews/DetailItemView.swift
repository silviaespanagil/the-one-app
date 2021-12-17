//
//  DetailItemView.swift
//  TheOneApp
//
//  Created by Silvia España on 14/12/21.
//

import SwiftUI

struct DetailItemView: View {
    
    var title: String
    var value: String?
    
    init(title: String, value: String?) {
        
        self.title = title
        self.value = value
    }
    
    var body: some View {
        
        if let value = value, !value.isEmpty {
            
            HStack {
                
                Text(title)
                    .font(.footnote)
                
                Spacer()
                
                VStack {
                    
                    Text(value)
                }
            }.padding(EdgeInsets(top: 0, leading: 15, bottom: 15, trailing: 15))
                .foregroundColor(Color("AppDarkGreen"))
        }
    }
}
