//
//  ClickableLabel.swift
//  testapp
//
//  Created by Michael Herring on 2014/06/07.
//  Copyright (c) 2014年 Michael Herring. All rights reserved.
//

import Cocoa

class ClickableLabel: NSTextField {

    override func mouseUp(theEvent: NSEvent!) {
        var upPoint = theEvent.locationInWindow
        if self.mouse(upPoint, inRect:self.frame) {
        //if self.hitTest(upPoint) == self {
            let valueAsURL = NSURL.URLWithString(self.stringValue)
            let appURL:NSURL? = NSWorkspace.sharedWorkspace().URLForApplicationToOpenURL(valueAsURL)
            if appURL != nil {
                NSWorkspace.sharedWorkspace().openURL(valueAsURL)
            }
            else {
                println("Maybe not a valid URL")
            }
        }
    }
    
}
