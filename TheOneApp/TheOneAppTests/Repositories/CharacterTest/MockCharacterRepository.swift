//
//  MockCharacterRepository.swift
//  TheOneAppTests
//
//  Created by Silvia España on 10/12/21.
//

import XCTest
import Combine
@testable import TheOneApp

class MockCharacterRepository: CharacterRepository {

    var isGetAllCharactersCalled = false
    var isCharacterDetailCalled = true

    func getAllCharacters(page: Int) -> AnyPublisher<[Character], Error> {

        self.isGetAllCharactersCalled = true

        return Just([])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func getCharacterDetail(id: String) -> AnyPublisher<Character, Error> {

        self.isCharacterDetailCalled = true

        return Just(Character(id: "5cd99d4bde30eff6ebccfc07",
                              height: "",
                              race: nil,
                              gender: "",
                              birth: "",
                              spouse: "",
                              death: "",
                              realm: "",
                              hair: "",
                              name: "Luthien",
                              wikiURL: "",
                              imageRace: ""))

            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()

    }

}

