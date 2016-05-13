//
//  AssetsGalleryViewController.swift
//  iOSTestApp
//
//  Created by X-User on 5/13/16.
//  Copyright © 2016 Zakhar Kozlov. All rights reserved.
//

import UIKit

class AssetsGalleryViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var buttonDone: UIButton!
    
    var assets : [Asset] = []
    var startingItem : Int = 0
    
    var currentPage:Int {
        get {
            return Int((self.collectionView.contentOffset.x / self.collectionView.contentSize.width) * CGFloat(self.assets.count))
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.registerNib(UINib(nibName: "ProjectAssetCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AssetCell")
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.hidden = true
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.collectionView.contentOffset = CGPoint(x: Int(self.collectionView.bounds.size.width) * self.startingItem, y: 0)
        self.collectionView.hidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        let _currentPage = self.currentPage
        coordinator.animateAlongsideTransition({ (context) in
            self.collectionView.contentOffset = CGPoint(x: Int(self.collectionView.bounds.size.width) * _currentPage, y: 0)
            }) { (context) in
                
        }
        self.collectionView.collectionViewLayout.invalidateLayout()
    }
    
    //MARK : - Actions
    
    @IBAction func done(sender: UIButton) {
        self.dismissViewControllerAnimated(true) { 
            
        }
    }
    
    //MARK : - Collection view data source
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.assets.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("AssetCell", forIndexPath: indexPath) as! ProjectAssetCollectionViewCell
        cell.imageView.contentMode = .ScaleAspectFit
        cell.update(self.assets[indexPath.item])
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return collectionView.bounds.size
    }
}
