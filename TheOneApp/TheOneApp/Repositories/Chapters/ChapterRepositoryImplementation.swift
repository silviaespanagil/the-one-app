//
//  ChapterRepositoryImplementation.swift
//  TheOneApp
//
//  Created by Silvia España on 20/12/21.
//

import Foundation
import Combine

class ChapterRepositoryImplementation: ChapterRepository {

    private let dataSource: ChapterDataSource
    
    init(dataSource: ChapterDataSource = ChapterDataSource()) {
        
        self.dataSource = dataSource
    }
    
    func getChaptersByBookId(id: String) -> AnyPublisher<[Chapter], Error> {

        return dataSource.getChaptersByBookId(id: id).map { serverChapter -> [Chapter] in
            
            var chapters: [Chapter] = []

            for serverChapter in serverChapter.docs {
                
                let chapter = serverChapter.convertToEntity()
                
                chapters.append(chapter)
            }

            return chapters
        }
        .mapError({ $0 })
        .eraseToAnyPublisher()

    }
}
