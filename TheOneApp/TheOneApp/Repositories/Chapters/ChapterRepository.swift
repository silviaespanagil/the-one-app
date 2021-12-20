//
//  ChapterRepository.swift
//  TheOneApp
//
//  Created by Silvia España on 20/12/21.
//

import Foundation
import Combine

protocol ChapterRepository {
    
    func getChaptersByBookId(id: String) -> AnyPublisher<[Chapter], Error>
}
