//
//  libnhkTests.swift
//  libnhkTests
//
//  Created by Michael Herring on 2014/06/03.
//  Copyright (c) 2014年 Michael Herring. All rights reserved.
//

import XCTest

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
        let bundle:NSBundle = NSBundle.mainBundle()
        let testURL:NSURL = bundle.URLForResource(named:"news-list.json")
        let newsObj:NHKEasyNews = NHKEasyNews(URL:testURL)
        XCTAssert((newsObj.dataCache != nil))
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
