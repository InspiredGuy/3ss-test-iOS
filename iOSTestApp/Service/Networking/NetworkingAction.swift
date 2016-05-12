//
//  NetworkingAction.swift
//  iOSTestApp
//
//  Created by X-User on 5/12/16.
//  Copyright © 2016 Zakhar Kozlov. All rights reserved.
//

import UIKit
import Alamofire

class NetworkingAction: NSObject {
    
    let name: String
    let method: Alamofire.Method
    
    init(name: String, method: Alamofire.Method) {
        self.name = name
        self.method = method
        super.init()
    }
}
