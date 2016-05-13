//
//  Asset.swift
//  iOSTestApp
//
//  Created by X-User on 5/13/16.
//  Copyright © 2016 Zakhar Kozlov. All rights reserved.
//

import UIKit

class Asset: NSObject {
    
    enum AssetType : String {
        case Image = "image"
        case Movie = "movie"
        case Document = "pdf"
    }
    
    let urlString : String
    let type : AssetType
    
    init(json: JSON) {
        self.urlString = json["url"].stringValue
        self.type = AssetType(rawValue: json["type"].stringValue) ?? .Document
        super.init()
    }
    
}
