//
//  ServerCharacterResponse.swift
//  TheOneApp
//
//  Created by Silvia España on 25/11/21.
//

import Foundation
import SwiftUI

struct ServerCharacterResponse: Codable {
    
    let _id: String
    let height: String?
    let race: String
    let gender: String?
    let birth: String?
    let spouse: String?
    let death: String?
    let realm: String?
    let hair: String?
    let name: String
    let wikiUrl: String?
    let imageRace: String?
    
    func convertToEntity() -> Character {
        
        return Character(id: _id,
                         height: height ?? "",
                         race: Race(rawValue: race) ?? .NaN,
                         gender: gender ?? "",
                         birth: birth ?? "",
                         spouse: spouse ?? "",
                         death: death ?? "",
                         realm: realm ?? "",
                         hair: hair ?? "",
                         name: name,
                         wikiURL: wikiUrl ?? "",
                         imageRace: getImageRace())
    }
    
    func getImageRace() -> String {
        
        let race = race.description
        
        if race == Race.Ainur.rawValue {
            
            return "https://static.wikia.nocookie.net/tolkien/images/3/31/Musica_degli_Ainur.jpg/revision/latest/top-crop/width/360/height/450?cb=20151023225959&path-prefix=it"
        }
        else if race == Race.Balrog.rawValue {
            
            return "https://pbs.twimg.com/profile_images/378800000054269606/3dd75f69faf233c299b7428a1c0ea811.jpeg"
        } else if race == Race.Dragon.rawValue || race == Race.Dragons.rawValue ||  race == Race.Horse.rawValue || race == Race.Raven.rawValue || race == Race.Urúloki.rawValue || race == Race.Werewolves.rawValue || race == Race.Wolfhound.rawValue {
            
            return "https://assets.myket.ir/icons/large/025cf0f6-cee5-412f-a4ae-1c121cda6fa2_.png"
        } else if race == Race.Dwarf.rawValue || race == Race.Dwarves.rawValue {
            
            return "https://media.onebite.app/f9/b6/e8/da/f9b6e8da-6230-4779-985d-e5225d1b1499.jpg"
        } else if race == Race.Eagle.rawValue || race == Race.Eagles.rawValue {
            
            return "https://pm1.narvii.com/6624/23f1b036e2c8a8f1aacc6f5c58de50464bbbd6d1_128.jpg"
        } else if race == Race.Elf.rawValue || race == Race.Elves.rawValue {
            
            return "https://ih1.redbubble.net/image.86187821.7774/flat,128x128,075,t-pad,128x128,f8f8f8.u7.jpg"
        } else if race == Race.Ent.rawValue || race == Race.Ents.rawValue {
            
            return "https://styles.redditmedia.com/t5_4p2zib/styles/profileIcon_egkn4c1uz0t71.png?width=256&height=256&crop=256:256,smart&s=e959e57d83f5d6ab70b501e9abe92df78a7eccbb"
        } else if race == Race.Goblin.rawValue || race == Race.Orcs.rawValue {
            
            return "https://external-preview.redd.it/t7_gvcuTYyupnGQ_0JNqgPAGNOOQ7p5jp2JendzjR1k.jpg?auto=webp&s=e83d341a1fef3d6cdffe7b8d43f5bc12aa64bb20"
        } else if race == Race.God.rawValue {
            
            return "https://cdn-img.fimfiction.net/user/7h5f-1431834832-213058-256"
        } else if race == Race.Hobbit.rawValue || race == Race.Hobbits.rawValue {
            
            return "https://disforge.com/assets/icons/814884027102265415.png?t=40732a1480bfa340f3b29a3e0ccf84eb"
        } else if race == Race.Human.rawValue || race == Race.Men.rawValue {
            
            return "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlQBUy_zJLmnctr_Dbb0sQJeuqbed-b8LRBQ&usqp=CAU"
        } else if race == Race.Maiar.rawValue || race == Race.Vampire.rawValue {
            
            return "https://pm1.narvii.com/6611/6fb86864529b8bea40ebb46f210bb1e307725a22_128.jpg"
        } else {
            
            return "https://upload.wikimedia.org/wikipedia/en/thumb/8/8d/JRRT_logo.svg/1200px-JRRT_logo.svg.png" }
    }
}
