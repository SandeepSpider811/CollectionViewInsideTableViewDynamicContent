//
//  DataClass.swift
//  ExpandingTest2
//
//  Created by Sierra 4 on 08/02/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//

import Foundation
class  DataClass {
    
    var contentHeading : String?
    var contentDescription : String?
    var contentImageURL : URL?
    var subContentImageURL : [URL]?
    var subContentName : [String]?
    
    init(contentHead : String? , contentDesc : String?, contentURL : URL?, subContURL : [URL]?, subContName : [String]? ) {
        self.contentHeading = contentHead
        self.contentDescription = contentDesc
        self.contentImageURL = contentURL
        self.subContentImageURL = subContURL
        self.subContentName = subContName
    }
}
