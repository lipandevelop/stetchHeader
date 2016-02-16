//
//  MasterViewController.swift
//  SketchHeader
//
//  Created by Li Pan on 2016-02-16.
//  Copyright © 2016 Li Pan. All rights reserved.
//

import UIKit


class MasterViewController: UITableViewController {
    
    private let kTableHeaderHeight: CGFloat = 300.0;
    private let kTableHeaderCutAway: CGFloat = 80.0
    
    var detailViewController: DetailViewController? = nil
    var objects = [AnyObject]()
    var headerMaskLayer: CAShapeLayer!
    var headerView: UIView!
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
        
        let effectiveHeight = kTableHeaderHeight-kTableHeaderCutAway/2
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        headerView = tableView.tableHeaderView;
        tableView.tableHeaderView = nil
        tableView .addSubview(headerView)
        tableView.contentInset = UIEdgeInsets(top: kTableHeaderHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -effectiveHeight)
        
        headerMaskLayer = CAShapeLayer()
        headerMaskLayer.fillColor = UIColor.blackColor().CGColor
        headerView.layer.mask = headerMaskLayer
        updateHeaderView()
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        prefersStatusBarHidden()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
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
    
    func updateHeaderView() {
        
        
        let effectiveHeight = kTableHeaderHeight-kTableHeaderCutAway/2

        var headerRect = CGRect(x: 0, y: -effectiveHeight, width: tableView.bounds.width, height: kTableHeaderHeight)
        if tableView.contentOffset.y < -effectiveHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        headerView.frame = headerRect
        
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: 0, y: 0))
        path.addLineToPoint(CGPoint(x: headerRect.width, y: 0))
        path.addLineToPoint(CGPoint(x: headerRect.width, y: headerRect.height))
        path.addLineToPoint(CGPoint(x: 0, y: headerRect.height-kTableHeaderCutAway))
        headerMaskLayer?.path = path.CGPath
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        updateHeaderView()
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

