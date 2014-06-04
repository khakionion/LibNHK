//
//  NHKEasyNews.swift
//  libnhk
//
//  Created by Michael Herring on 2014/06/03.
//  Copyright (c) 2014年 Michael Herring. All rights reserved.
//

import Foundation

class NHKEasyNews: NSObject {
    var dataCache: NSData
    init(Data data:NSData) {
        dataCache = data
    }
    convenience init(URL url:NSURL) {
        self.init(Data: NSData(contentsOfURL:url))
    }
    convenience init() {
        let easyURL:NSURL = NSURL(string: "http://www3.nhk.or.jp/news/easy/news-list.json")
        self.init(URL:easyURL)
    }
}
