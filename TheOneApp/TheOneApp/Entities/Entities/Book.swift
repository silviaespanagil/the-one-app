//
//  Book.swift
//  TheOneApp
//
//  Created by Silvia España on 17/12/21.
//

import Foundation

struct Book: Identifiable, Equatable {
    
    let id: String
    let name: String
    let chapterName: String?
    let bookImage: String
}
