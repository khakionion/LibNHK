//
//  ViewController.swift
//  testapp
//
//  Created by Michael Herring on 2014/06/02.
//  Copyright (c) 2014年 Michael Herring. All rights reserved.
//

import Cocoa
import LibNHK

class ViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {
    @IBOutlet var newsIDLabel : NSTextField
    @IBOutlet var arrangeDateLabel : NSTextField
    @IBOutlet var publishDateLabel : NSTextField
    var news:NHKEasyNews?
    @IBOutlet var newsListController:NSArrayController?
    @IBOutlet var tableView:NSTableView
    @IBOutlet var linkLabel : NSTextField
    override func viewDidLoad() {
        super.viewDidLoad()
        let center = NSNotificationCenter.defaultCenter()
        center.addObserver(self, selector:"loadNewsData:", name:"PressedRefreshButton", object: nil)
    }
    
    override func awakeFromNib() {
    }
    @IBAction func loadNewsData(sender:AnyObject?) {
        let mainBundle = NSBundle.mainBundle()
        let failsafeURL:NSURL = mainBundle.URLForResource("news-list", withExtension:"json")
        news = NHKEasyNews(/*URL: failsafeURL*/)
        self.tableView.reloadData()
    }
    
    func numberOfRowsInTableView(tableView: NSTableView!) -> Int {
        if self.news == nil {
            return 0
        }
        return self.news!.articleStore!.count
    }
    func tableViewSelectionDidChange(notification: NSNotification!) {
        //grab the article
        let tableView:NSTableView = notification.object as NSTableView
        let selectedRow = tableView.selectedRow
        let selectedArticle:NHKArticle! = news!.articleAtIndex(selectedRow)
        //set the Identifier
        let theID = selectedArticle.identifier
        newsIDLabel.setTitleWithMnemonic(theID)
        //set the dates
        let publishString = selectedArticle.publishDate
        publishDateLabel.setTitleWithMnemonic(publishString)
        let arrangeString = selectedArticle.arrangeDate
        arrangeDateLabel.setTitleWithMnemonic(arrangeString)
        let linkString = selectedArticle.permalink
        linkLabel.setTitleWithMnemonic(linkString!.absoluteString)
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

