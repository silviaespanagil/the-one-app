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
                  "https://lh3.googleusercontent.com/proxy/MRlmOXXcu2d6zGLnF_08gZ7WCeSDwjevPzrbuB9Ajru1sLSWFQQgT4qVy6oVrYbAdPz-n2iVjScn7Ak6Upji1UmyO0DOrm6YsORqgw2B848bxpSmo2vGT1V9LL8jsTaZgP9KzaabdhgpFxU",
                  "https://media-cldnry.s-nbcnews.com/image/upload/newscms/2020_47/3429862/201120-_j-r-r-_tolkien-mc-11532.jpg"]
    }


}
