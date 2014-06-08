//
//  AppDelegate.swift
//  testapp
//
//  Created by Michael Herring on 2014/06/02.
//  Copyright (c) 2014年 Michael Herring. All rights reserved.
//

import Cocoa
import LibNHK

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(aNotification: NSNotification?) {
    }

    func applicationWillTerminate(aNotification: NSNotification?) {
        // Insert code here to tear down your application
    }

    @IBAction func refreshNews(sender:AnyObject?) {
        let myNotify:NSNotification = NSNotification(name:"PressedRefreshButton", object:self, userInfo:nil)
        NSNotificationCenter.defaultCenter().postNotification(myNotify)
    }

}

