//
//  NHKArticle.swift
//  libnhk
//
//  Created by Michael Herring on 2014/06/04.
//  Copyright (c) 2014年 Michael Herring. All rights reserved.
//

import Foundation

class NHKArticle : NSObject {
    struct NHKArticleInfo {
        var permalink: NSURL
        var title: String
        var publishDate: String
        var identifier: String
    }
    var info: NHKArticleInfo!
    var textBody: String?
    init(info:NHKArticleInfo) {
        self.info = info
        textBody = nil
    }
}