//
//  CharacterRepository.swift
//  TheOneApp
//
//  Created by Silvia España on 26/11/21.
//

import Foundation
import Combine

protocol CharacterRepository {
    
    func getAllCharacters(page: Int) -> AnyPublisher<[Character], Error>
}
