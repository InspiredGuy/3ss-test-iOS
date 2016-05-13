//
//  ProjectAssetsDataSource.swift
//  iOSTestApp
//
//  Created by X-User on 5/13/16.
//  Copyright © 2016 Zakhar Kozlov. All rights reserved.
//

import UIKit

class ProjectAssetsDataSource: NSObject, UICollectionViewDataSource {
    
    private var _dataSource : [Asset] = []
    
    var assets : [Asset] {
        get {
            return self._dataSource
        }
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self._dataSource.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("AssetCell", forIndexPath: indexPath) as! ProjectAssetCollectionViewCell
        cell.update(self._dataSource[indexPath.row])
        return cell
    }
    
    // MARK : - Custom
    
    func loadData(projectId: Int, callback: ((Void) -> Void)?) {
        NetworkingService.call(Constants.API.Action.Assets, params: ["projectId" : projectId])
            .then { response -> Void in
                self._dataSource = []
                response["assets"].arrayValue.forEach({ (asset) in
                    self._dataSource.append(Asset(json: asset))
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
