//
//  DetailIntroView.swift
//  TheOneApp
//
//  Created by Silvia España on 17/12/21.
//

import SwiftUI

struct DetailIntroView: View {
    
    var image: String
    var name: String
    var width: CGFloat
    var height: CGFloat?
    
    init(image: String, name: String, width: CGFloat, height: CGFloat) {
        
        self.image = image
        self.name = name
        self.width = width
        self.height = height
    }
    
    var body: some View {
        
        VStack {
            
            Image("")
                .renderImage(url: URL(string: image)!)
                .frame(width: width, height: height)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .shadow(color:Color("AppMediumGreen"), radius: 3, x: 0, y: 3)
                .padding()
            
            Text(name)
                .foregroundColor(Color("AppWhite"))
                .font(.title)
                .fontWeight(.bold)
                .tracking(5)
                .textCase(.uppercase)
                .fixedSize(horizontal: false, vertical: true)
                .tag("detailIntroText")
        }
    }
}
