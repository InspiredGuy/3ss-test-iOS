//
//  Constants.swift
//  iOSTestApp
//
//  Created by X-User on 5/12/16.
//  Copyright © 2016 Zakhar Kozlov. All rights reserved.
//

import UIKit
import Alamofire

struct Constants {
    
    struct API {
        static let BaseURL = "http://91.250.82.77:8081/3ssdemo/prj/json/"
        
        struct Action {
            static let Projects = NetworkingAction(name: "projects.php", method: .GET)
            static let Clients = NetworkingAction(name: "clients.php", method: .GET)
            static let Assets = NetworkingAction(name: "galleryAssets.php", method: .GET)
        }
        
    }
    
}