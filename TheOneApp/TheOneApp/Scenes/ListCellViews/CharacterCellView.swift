//
//  CharacterCellView.swift
//  TheOneApp
//
//  Created by Silvia España on 9/12/21.
//

import SwiftUI

struct CharacterCellView: View {
    
    let id: String
    let race: String?
    let birth: String?
    let death: String?
    let name: String?
    let image: String
    
    init(id: String, race: String?, birth: String?, death: String?, name: String, image: String) {
        
        self.id = id
        self.race = race
        self.birth = birth
        self.death = death
        self.name = name
        self.image = image
    }
    var body: some View {
        
        HStack {
            
            Image("")
                .renderImage(url: URL(string: image)!)
                .frame(width: 50, height: 50)
                .padding()
                .clipShape(RoundedRectangle(cornerRadius: 50))
                .shadow(color: Color.gray, radius: 2, x: 0, y: 2)
            
            VStack {
                
                Text(name ?? "")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(race ?? "")
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    
                    Text(birth ?? "Unknown birth date")
                    Text("/")
                    Text(death ?? "Unknown death date")
                } .frame(maxWidth: .infinity, alignment: .leading)
            }
        }.padding()
    }
}

struct CharacterCellView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCellView(id: "id", race: "Men", birth: "March 1, 2931", death: "Fo.A. 120 ", name: "Aragorn II, Elessar", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Blason_Gondor.svg/1862px-Blason_Gondor.svg.png")
    }
}
