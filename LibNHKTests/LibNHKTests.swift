//
//  libnhkTests.swift
//  libnhkTests
//
//  Created by Michael Herring on 2014/06/03.
//  Copyright (c) 2014年 Michael Herring. All rights reserved.
//

import XCTest
import LibNHK

class libnhkTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testArticleLoading() {
        //let testURL:NSURL = bundle.URLForResource("news-list", withExtension:"json")
        //let testData:NSData = NSData(contentsOfFile:"/Users/michaelh/Desktop/news-list.json")
        let newsObj:NHKEasyNews = NHKEasyNews()
        XCTAssert((newsObj.articleStore != nil))
        XCTAssert(newsObj.articleStore!.count > 0)
        for nextArticle:NHKArticle in newsObj.articleStore! {
            //println("Next article: " + nextArticle.title!)
        }
    }    
}
