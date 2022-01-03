//
//  CharacterCellView.swift
//  TheOneApp
//
//  Created by Silvia España on 9/12/21.
//

import SwiftUI
import Combine

struct CharacterCellView: View {
    
    let id: String
    let race: String?
    let name: String
    let image: String
    
    internal let inspection = Inspection<Self>()
    
    init(id: String, race: String?, name: String, image: String) {
        
        self.id = id
        self.race = race
        self.name = name
        self.image = image
    }
    
    var body: some View {
        
        HStack {
            
            Image("")
                .renderImage(url: URL(string: image)!)
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .shadow(color: .gray, radius: 3, x: 0, y: 3)
                .padding()
                
            VStack {
                
                Text(name)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title2)
                    .padding(.bottom, 10)
                    .tag("characterName")
                Text(race ?? "")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.footnote)
                    .tag("characterRace")
            }
        }.onReceive(inspection.notice) {
            
            self.inspection.visit(self, $0)
        }
    }
}

struct CharacterCellView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCellView(id: "id", race: "Men", name: "Aragorn II, Elessar", image: "https://pbs.twimg.com/profile_images/378800000054269606/3dd75f69faf233c299b7428a1c0ea811.jpeg")
    }
}
