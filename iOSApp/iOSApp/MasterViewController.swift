//
//  MasterViewController.swift
//  iOSApp
//
//  Created by Michael Herring on 2014/06/08.
//  Copyright (c) 2014年 Sun, Sea and Sky Factory. All rights reserved.
//

import UIKit
import LibNHKios

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var news:NHKEasyNews! = NHKEasyNews()


    override func awakeFromNib() {
        super.awakeFromNib()
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            self.clearsSelectionOnViewWillAppear = false
            self.preferredContentSize = CGSize(width: 320.0, height: 600.0)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let addButton = UIBarButtonItem(barButtonSystemItem: .Refresh, target: self, action: "refreshData:")
        self.navigationItem.rightBarButtonItem = addButton
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = controllers[controllers.endIndex-1].topViewController as? DetailViewController
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func refreshData(sender: AnyObject) {
        if news.articleStore == nil {
            return
        }
        self.tableView.reloadData()
    }

    // #pragma mark - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let articles = news.articleStore {
                let indexPath = self.tableView.indexPathForSelectedRow()
                let object = articles[indexPath.row]
                ((segue.destinationViewController as UINavigationController).topViewController as DetailViewController).detailItem = object
            }
        }
    }

    // #pragma mark - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let articles = news.articleStore {
            return articles.count
        }
        return 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

        if let articles = news.articleStore {
            let thisArticle = articles[indexPath.row]
            cell.textLabel.text = thisArticle.title
        }
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            if let articles = news.articleStore {
                let theArticle = articles[indexPath.row]
                self.detailViewController!.detailItem = theArticle
            }
            
        }
    }


}

