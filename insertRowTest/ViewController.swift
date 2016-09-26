//
//  ViewController.swift
//  insertRowTest
//
//  Created by Edward Hung on 25/09/2016.
//  Copyright © 2016 Edward Hung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    var xibRef: myHeaderView!
    var numberOfSection = 30
    var testCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        
        
        // Register Xib
        let nib = UINib(nibName: "myHeaderView", bundle: nil)
        self.xibRef = nib.instantiateWithOwner(self, options: nil)[0] as? myHeaderView
        self.myTableView.registerNib(nib, forHeaderFooterViewReuseIdentifier: "myHeaderView")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addRowBtnPressed(sender: AnyObject) {
        
        testCounter = 0
        
        numberOfSection += 1
        let sections = NSIndexSet(index: numberOfSection - 1)
        myTableView.insertSections(sections, withRowAnimation: .None)
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath) as! MyCell
        
        cell.textLabel!.text = "section \(indexPath.section) row \(indexPath.row)"
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return numberOfSection
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 30
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 300
    }
    
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        print("testCounter \(testCounter)")
        testCounter += 1
        
        let cell = tableView.dequeueReusableHeaderFooterViewWithIdentifier("myHeaderView") as! myHeaderView
        
        return cell
    }
}

