//
//  NHKArticle.swift
//  libnhk
//
//  Created by Michael Herring on 2014/06/04.
//  Copyright (c) 2014年 Michael Herring. All rights reserved.
//

import Foundation

class NHKArticle : NSObject {
    var permalink: NSURL?
    var title: String?
    var publishDate: String?
    var identifier: String?
    var textBody: String?
    init() {
        self.permalink = nil
        self.title = nil
        self.publishDate = nil
        self.identifier = nil
        textBody = nil
    }
    var articleTitle:NSString {
    get {
        println("Returning \(self.title)")
        if self.title != nil {
            return self.title!
        }
        return "NOTHING"
    }
    }
}