//
//  MainViewModel.swift
//  TheOneApp
//
//  Created by Silvia España on 14/12/21.
//

import Foundation
import SwiftUI

class MainViewModel: ObservableObject {
    
    @Published public private(set) var mainTitles: [String]
    @Published public private(set) var mainImages: [String]
    
    init() {

    mainTitles = [ "Characters", "Movies", "Books", "Quote of the day"]
    mainImages = ["https://d1nslcd7m2225b.cloudfront.net/Pictures/1024x536/4/7/7/1252477_fellowship.jpg",
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAV8OIFXpBbpzyb85SjMgTqBjpLsE8TlLACw&usqp=CAU",
                  "https://www.theonering.net/torwp/wp-content/uploads/2013/12/Frodo-writing.jpg",
                  "https://media-cldnry.s-nbcnews.com/image/upload/newscms/2020_47/3429862/201120-_j-r-r-_tolkien-mc-11532.jpg"]
    }


}
