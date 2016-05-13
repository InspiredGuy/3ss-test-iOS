//
//  ProjectsDataSource.swift
//  iOSTestApp
//
//  Created by X-User on 5/11/16.
//  Copyright © 2016 Zakhar Kozlov. All rights reserved.
//

import UIKit
import Alamofire
import PromiseKit

class ProjectsDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private var _dataSource: [Project] = []
    
    var projects : [Project] {
        get {
            return self._dataSource
        }
    }
    
    // MARK : - Table view
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self._dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ProjectCell", forIndexPath: indexPath) as! ProjectTableViewCell
        cell.layoutMargins = UIEdgeInsetsZero;
        cell.update(self._dataSource[indexPath.row])
        return cell
    }
    
    // MARK : - Custom
    
    func loadData(callback: ((Void) -> Void)?) {
        NetworkingService.call(Constants.API.Action.Clients, params: nil).then { (response) -> Promise<JSON> in
            ClientStorage.sharedInstance.refill(response["clients"].arrayValue)
            return NetworkingService.call(Constants.API.Action.Projects, params: nil)
        }.then { response -> Void in
            self._dataSource = []
            response["projects"].arrayValue.forEach({ (project) in
                self._dataSource.append(Project(json: project))
            })
        }.always {
            if let call = callback {
                call()
            }
        }.error { error in
            print(error)
        }
    }
    
}
