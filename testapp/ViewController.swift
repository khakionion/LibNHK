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
    var myNews:NHKEasyNews?
    @IBOutlet
    var newsListController:NSArrayController?
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
                                    
    }
    
    override func awakeFromNib() {
        let mainBundle = NSBundle.mainBundle()
        let nhkURL:NSURL = mainBundle.URLForResource("news-list", withExtension:"json")
        myNews = NHKEasyNews(URL: nhkURL)
    }


}

