//
//  MasterViewController.swift
//  SketchHeader
//
//  Created by Li Pan on 2016-02-16.
//  Copyright © 2016 Li Pan. All rights reserved.
//

import UIKit


class MasterViewController: UITableViewController {
    
    var detailViewController: DetailViewController? = nil
    var objects = [AnyObject]()
    let items = [
        NewsItem(category: .World, summary: "Climate Change Protests, divestments meet fossil fuels realities"),
        NewsItem(category: .Europe, summary: "Admission is $8500 US but will 'echo in your soul' says one TED veteran. Read on for how to watch free"),
        NewsItem(category: .MiddleEast, summary: "Cancer 'cure' hope, Stephen Fry's 'bag lady' and laser danger"),
        NewsItem(category: .Africa, summary: "President Barack Obama Inaugurates Asian Trade Summit In California"),
        NewsItem(category: .AsiaPacific, summary: "China Stock Market Rallies"),
        NewsItem(category: .Americas, summary: "Kanye West: 'White Publications' Stop Commenting On 'Black Music' (TWEETS)"),
        NewsItem(category: .World, summary: "3 Americans Kidnapped In Iraq Freed, Iraqi Officials Say"),
        NewsItem(category: .Europe, summary: "Ukraine Bans Russian Cargo Trucks"),
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
        //        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        //        self.navigationItem.rightBarButtonItem = addButton
    }
    
    override func viewWillAppear(animated: Bool) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //    func insertNewObject(sender: AnyObject) {
    //        objects.insert(NSDate(), atIndex: 0)
    //        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
    //        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    //    }
    
    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row] as! NewsCell
                let controller = segue.destinationViewController as! DetailViewController
                controller.detailItem = object
            }
        }
    }
    
    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("NewsCellIdentifieer", forIndexPath: indexPath) as! NewsCell
        cell.newsItem = item
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            objects.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    //    func loadData() {
    //        let newsItem1 = NewsItem(category: "first News", headline: "News on the first line")
    //        self.objects
    //    }
    
    
}

