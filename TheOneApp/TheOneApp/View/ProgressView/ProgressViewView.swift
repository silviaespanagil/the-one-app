//
//  ProgressViewView.swift
//  TheOneApp
//
//  Created by Silvia España on 9/12/21.
//

import SwiftUI

struct ProgressViewView: View {
    
    var body: some View {
        
        HStack() {
            
            Spacer()
            
            ProgressView("Checking on the middle earth")
                .font(.footnote)
                .progressViewStyle(CircularProgressViewStyle(tint: Color.green))
            
            Spacer()
        }
    }
}

struct ProgressViewView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressViewView()
    }
}
