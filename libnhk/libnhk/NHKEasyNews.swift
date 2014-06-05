//
//  NHKEasyNews.swift
//  libnhk
//
//  Created by Michael Herring on 2014/06/03.
//  Copyright (c) 2014年 Michael Herring. All rights reserved.
//

import Foundation

typealias ArticleCatalog = Dictionary<String,ArticleEntry[]>
typealias ArticleEntry = Dictionary<String,String>

class NHKEasyNews: NSObject {
    var dataCache: NSData
    var articleStore: Array<NHKArticle>?
    init(data:NSData) {
        dataCache = data
        articleStore = Array<NHKArticle>()
        super.init()
        if data != nil {
            self.processData(dataCache)
        }
    }
    convenience init(URL url:NSURL) {
        self.init(data: NSData(contentsOfURL:url))
    }
    convenience init() {
        let easyURL:NSURL = NSURL(string: "http://www3.nhk.or.jp/news/easy/news-list.json")
        self.init(URL:easyURL)
    }
    func processData(data:NSData) {
        let err:NSErrorPointer = nil
        let newsArrayWrapper:NSArray = NSJSONSerialization.JSONObjectWithData(data,options: .MutableLeaves, error: err) as Array<ArticleCatalog>
        let innerDict:ArticleCatalog = newsArrayWrapper[0] as ArticleCatalog
        var returnArray = NHKArticle[]()
        for (date, articleArray) in innerDict {
            for nextArticle:ArticleEntry in articleArray {
                let info:NHKArticle.NHKArticleInfo = NHKArticle.NHKArticleInfo(permalink: NSURL(string:nextArticle["news_web_url"]),
                    title:nextArticle["title"]!,
                    publishDate:nextArticle["news_prearranged_time"]!,
                    identifier:nextArticle["news_id"]!)
                let article:NHKArticle = NHKArticle(info: info)
                returnArray.append(article)
            }
        }
        articleStore = returnArray
    }
}
