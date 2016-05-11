//
//  ProjectsDataSource.swift
//  iOSTestApp
//
//  Created by X-User on 5/11/16.
//  Copyright © 2016 Zakhar Kozlov. All rights reserved.
//

import UIKit

class ProjectsDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    
    // MARK : - Table view
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ProjectCell", forIndexPath: indexPath) as! ProjectTableViewCell
        cell.layoutMargins = UIEdgeInsetsZero;
        return cell
    }
    
    // MARK : - Custom methods
    
    func loadData(callback: ((Void) -> Void)) {
        // TODO : Network request to load data
    }
    
}
