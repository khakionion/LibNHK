//
//  ViewController.swift
//  testapp
//
//  Created by Michael Herring on 2014/06/02.
//  Copyright (c) 2014年 Michael Herring. All rights reserved.
//

import Cocoa
import libnhk

class ViewController: NSViewController {
    var myNews:NHKEasyNews
    @IBOutlet
    var newsListController:NSArrayController?
    convenience init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        self.init()
    }
    convenience init(coder: NSCoder!) {
        self.init()
    }
    init() {
        let nhkData = NSData(contentsOfFile:"/Users/michaelh/Desktop/news-list.json")
        myNews = NHKEasyNews(data: nhkData)
        newsListController = nil
        super.init()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
                                    
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
                                    
    }


}

