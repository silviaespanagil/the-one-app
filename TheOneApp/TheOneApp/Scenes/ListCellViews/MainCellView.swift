//
//  MainCellView.swift
//  TheOneApp
//
//  Created by Silvia España on 14/12/21.
//

import SwiftUI

struct MainCellView: View {
    
    let name: String
    
    init(name: String) {
        
        self.name = name
    }
    
    var body: some View {
        
        HStack{
            
            Text(name)
                .font(.headline)
                .fontWeight(.bold)
                .tracking(5)
                .textCase(.uppercase)
                .frame(maxWidth: .infinity)
                .foregroundColor(Color.white)
        }
    }
}
    
    struct MainCellView_Previews: PreviewProvider {
        
        static var previews: some View {
            
            MainCellView(name:"Characters")
        }
    }

