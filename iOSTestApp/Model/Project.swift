//
//  Project.swift
//  iOSTestApp
//
//  Created by X-User on 5/11/16.
//  Copyright © 2016 Zakhar Kozlov. All rights reserved.
//

import UIKit

class Project: NSObject {
    
    let id : Int
    let name : String
    let year : Int
    let descriptionText : String
    let imageURLString : String
    let clientId : Int
    let solutionTypes : [String]
    let technologies : [String]
    let supportedScreens : [String]
    
    init(json: JSON) {
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
        self.year = json["year"].intValue
        self.descriptionText = json["description"].stringValue
        self.imageURLString = json["image"]["url"].stringValue
        self.clientId = json["clientId"].intValue
        
        self.solutionTypes = Project.getStringArray(json["solutionTypes"])
        self.technologies = Project.getStringArray(json["technologies"])
        self.supportedScreens = Project.getStringArray(json["supportedScreens"])
        
        super.init()
    }
    
    private static func getStringArray(json: JSON) -> [String] {
        var array = [String]()
        json.arrayValue.forEach { (elem) in
            array.append(elem.stringValue)
        }
        return array
    }
    
}
