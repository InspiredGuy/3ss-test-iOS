//
//  ClientStorage.swift
//  iOSTestApp
//
//  Created by X-User on 5/13/16.
//  Copyright © 2016 Zakhar Kozlov. All rights reserved.
//

import UIKit

class ClientStorage {
    
    static let sharedInstance = ClientStorage()
    private init() {}
    
    private var _clients : [Int:Client] = [:]
    
    func refill(clients: [JSON]) {
        self._clients = [:]
        clients.forEach { (clientJSON) in
            let client = Client(json: clientJSON)
            self._clients[client.id] = client
        }
    }
    
    func objectAtIndex(index: Int) -> Client? {
        return self._clients[index]
    }

}
