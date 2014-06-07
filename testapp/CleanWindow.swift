//
//  CleanWindow.swift
//  testapp
//
//  Created by Michael Herring on 2014/06/07.
//  Copyright (c) 2014年 Michael Herring. All rights reserved.
//

import Cocoa

class CleanWindow: NSWindow {
    override func awakeFromNib() {
        self.titleVisibility = NSWindowTitleVisibility.Hidden
    }
    @IBAction func refreshNews(sender:AnyObject?) {
        let myNotify:NSNotification = NSNotification(name:"PressedRefreshButton", object:self, userInfo:nil)
        NSNotificationCenter.defaultCenter().postNotification(myNotify)
    }
}
