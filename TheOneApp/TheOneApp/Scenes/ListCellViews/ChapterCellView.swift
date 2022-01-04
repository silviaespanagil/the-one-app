//
//  ChapterCellView.swift
//  TheOneApp
//
//  Created by Silvia España on 20/12/21.
//

import SwiftUI

struct ChapterCellView: View {
    
    let id: String
    let chapterName: String
    
    init(id: String, chapterName: String) {
        
        self.id = id
        self.chapterName = chapterName
    }
    
    var body: some View {
        
        HStack {
            
            VStack {
                
                Text(chapterName)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .tag("chapterName")
            }
        }
    }
}

struct ChapterCellView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ChapterCellView(id: "id", chapterName: "A Knife in the Dark")
    }
}
