//
//  ViewController.swift
//  testapp
//
//  Created by Michael Herring on 2014/06/02.
//  Copyright (c) 2014年 Michael Herring. All rights reserved.
//

import Cocoa
import libnhk

class ViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {
    var news:NHKEasyNews?
    @IBOutlet
    var newsListController:NSArrayController?
    @IBOutlet
    var tableView:NSTableView
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func awakeFromNib() {
    }
    @IBAction
    func loadNewsData(sender:AnyObject?) {
        let mainBundle = NSBundle.mainBundle()
        let nhkURL:NSURL = mainBundle.URLForResource("news-list", withExtension:"json")
        news = NHKEasyNews(URL: nhkURL)
        self.tableView.reloadData()
    }
    
    func numberOfRowsInTableView(tableView: NSTableView!) -> Int {
        if self.news == nil {
            return 0
        }
        return self.news!.articleStore!.count
    }
    func tableView(tableView: NSTableView!, objectValueForTableColumn tableColumn: NSTableColumn!, row: Int) -> AnyObject! {
        if self.news != nil {
            if self.news!.articleStore != nil {
                return self.news!.articleStore![row].title
            }
        }
        return "NOTHING"
    }
}

