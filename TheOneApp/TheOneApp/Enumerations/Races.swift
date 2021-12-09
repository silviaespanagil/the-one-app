//
//  Races.swift
//  TheOneApp
//
//  Created by Silvia España on 9/12/21.
//

import Foundation

enum Race: String, CaseIterable {
    case Ainur, Balrog, Dragon, Dragons, Dwarf, Dwarves, Eagle, Eagles, Elf, Elves, Ent, Ents, Goblin, God, Hobbit, Hobbits, Horse, Human, Maiar, Men, NaN, Orcs, Raven, Urúloki, Vampire, Werewolves, Wolfhound, Wraith
    
    var description: String {
        switch self {
        case .Ainur:
            return "Ainur"
        case .Balrog:
            return "Balrog"
        case .Dwarf, .Dwarves:
            return "Dwarf"
        case .Eagle, .Eagles:
            return "Eagles"
        case .Elf, .Elves:
            return "Elf"
        case .Ent, .Ents:
            return "Ent"
        case .Goblin, .Orcs, .Wraith:
            return "Mordor creature"
        case .God:
            return "God"
        case .Hobbit, .Hobbits:
            return "Hobbit"
        case .Dragon, .Dragons, .Horse, .Raven, .Urúloki, .Werewolves, .Wolfhound :
            return "Beast or animal of Middle Earth"
        case .Human, .Men:
            return "Human"
        case .Maiar, .Vampire:
            return "Maiar"
        case .NaN:
            return "Race not specified"
        }
    }
}
