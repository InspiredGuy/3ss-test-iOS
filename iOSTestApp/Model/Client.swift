//
//  Client.swift
//  iOSTestApp
//
//  Created by X-User on 5/11/16.
//  Copyright © 2016 Zakhar Kozlov. All rights reserved.
//

import UIKit

class Client: NSObject {
    
    let id : Int
    let name : String
    
    init(json: JSON) {
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
        super.init()
    }
}
