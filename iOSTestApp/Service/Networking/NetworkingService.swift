//
//  NetworkingService.swift
//  iOSTestApp
//
//  Created by X-User on 5/12/16.
//  Copyright © 2016 Zakhar Kozlov. All rights reserved.
//

import UIKit
import PromiseKit
import Alamofire

class NetworkingService {
    
    class func call(action: NetworkingAction, params: [String:AnyObject]?) -> Promise<JSON> {
        return Promise(resolvers: { (fulfill, reject) in
            Alamofire.request(action.method, Constants.API.BaseURL + action.name, parameters: params, encoding: .URL, headers: nil)
                    .validate()
                    .responseJSON { response in
                        switch response.result {
                        case .Success:
                            if let val = response.result.value {
                                fulfill(JSON(val))
                            } else {
                                abort()
                            }
                        case .Failure(let error):
                            reject(error)
                        }
            }
        })
    }

}
