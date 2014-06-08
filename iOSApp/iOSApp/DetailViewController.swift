//
//  DetailViewController.swift
//  iOSApp
//
//  Created by Michael Herring on 2014/06/08.
//  Copyright (c) 2014年 Sun, Sea and Sky Factory. All rights reserved.
//

import UIKit
import LibNHKios

class DetailViewController: UIViewController, UISplitViewControllerDelegate {

    @IBOutlet var detailDescriptionLabel: UILabel
    @IBOutlet var detailArrangeLabel : UILabel
    @IBOutlet var detailPublishLabel : UILabel
    @IBOutlet var detailURLLabel : UILabel
    var masterPopoverController: UIPopoverController? = nil


    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()

            if self.masterPopoverController != nil {
                self.masterPopoverController!.dismissPopoverAnimated(true)
            }
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: NHKArticle = self.detailItem as? NHKArticle {
            if let label = self.detailDescriptionLabel {
                label.text = detail.identifier
            }
            if let label = self.detailArrangeLabel {
                label.text = detail.arrangeDate
            }
            if let label = self.detailPublishLabel {
                label.text = detail.publishDate
            }
            if let label = self.detailURLLabel {
                label.text = detail.permalink!.absoluteString
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // #pragma mark - Split view

    func splitViewController(splitController: UISplitViewController, willHideViewController viewController: UIViewController, withBarButtonItem barButtonItem: UIBarButtonItem, forPopoverController popoverController: UIPopoverController) {
        barButtonItem.title = "Master" // NSLocalizedString(@"Master", @"Master")
        self.navigationItem.setLeftBarButtonItem(barButtonItem, animated: true)
        self.masterPopoverController = popoverController
    }

    func splitViewController(splitController: UISplitViewController, willShowViewController viewController: UIViewController, invalidatingBarButtonItem barButtonItem: UIBarButtonItem) {
        // Called when the view is shown again in the split view, invalidating the button and popover controller.
        self.navigationItem.setLeftBarButtonItem(nil, animated: true)
        self.masterPopoverController = nil
    }
    func splitViewController(splitController: UISplitViewController, collapseSecondaryViewController secondaryViewController: UIViewController, ontoPrimaryViewController primaryViewController: UIViewController) -> Bool {
        // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
        return true
    }

}

