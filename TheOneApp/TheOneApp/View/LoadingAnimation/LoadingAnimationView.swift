//
//  LoadingAnimationView.swift
//  TheOneApp
//
//  Created by Silvia España on 9/12/21.
//

import SwiftUI

struct LoadingAnimationView: View {
    
    var body: some View {
        
        HStack() {
            
            Spacer()
            
            LoadingAnimationViewLottieImplementation(name: "loadingAnimationLottieJson", loopMode: .loop)
                .frame(width: 100, height: 100)
            
            Spacer()
        }
    }
}

struct LoadingAnimationView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        LoadingAnimationView()
    }
}
