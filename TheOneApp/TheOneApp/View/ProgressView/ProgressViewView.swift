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
            
            ProgressViewLottieImplementation(name: "progressViewLottieJson", loopMode: .loop)
                        .frame(width: 100, height: 100)

            Spacer()
        }
    }
}

struct ProgressViewView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ProgressViewView()
    }
}
