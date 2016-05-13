//
//  ProjectDetailsViewController.swift
//  iOSTestApp
//
//  Created by X-User on 5/11/16.
//  Copyright © 2016 Zakhar Kozlov. All rights reserved.
//

import UIKit
import MediaPlayer

class ProjectDetailsViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet weak var imageViewLogo: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelYear: UILabel!
    @IBOutlet weak var labelSupportedScreens: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelClient: UILabel!
    @IBOutlet weak var labelSolutionTypes: UILabel!
    @IBOutlet weak var labelTechnologies: UILabel!
    @IBOutlet weak var labelAssets: UILabel!
    @IBOutlet weak var collectionViewAssets: UICollectionView!
    
    @IBOutlet weak var scrollViewWrap: UIScrollView!
    @IBOutlet weak var viewContentWrap: UIView!
    @IBOutlet weak var viewOverlay: UIView!
    
    var project : Project!
    var dataSource = ProjectAssetsDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionViewAssets.registerNib(UINib(nibName: "ProjectAssetCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AssetCell")
        self.collectionViewAssets.dataSource = self.dataSource
        self.collectionViewAssets.delegate = self
        self.update()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func didMoveToParentViewController(parent: UIViewController?) {
        super.didMoveToParentViewController(parent)
        self.project = nil
    }
    
    func update() {
        if self.project == nil {
            return
        }
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        self.labelAssets.hidden = true
        self.imageViewLogo.sd_setImageWithURL(NSURL(string: self.project.imageURLString))
        self.dataSource.loadData(self.project.id) { () in
            self.labelAssets.hidden = self.dataSource.assets.isEmpty
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            self.collectionViewAssets.reloadData()
        }
        
        self.viewOverlay.hidden = true
        
        self.labelTitle.text = self.project.name
        self.labelYear.text = "\(self.project.year)"
        self.labelYear.hidden = (self.project.year == 0)
        
        self.labelSupportedScreens.text = self.project.supportedScreens.joinWithSeparator(", ")
        self.labelSupportedScreens.hidden = self.project.supportedScreens.isEmpty
        
        self.labelDescription.text = self.project.descriptionText
        self.labelDescription.hidden = (self.project.descriptionText == "")
        
        if let clientName = ClientStorage.sharedInstance.objectAtIndex(self.project.clientId)?.name {
            self.setAttributedTitle(self.labelClient, prefix: Constants.LabelPrefix.Client, content: clientName)
        } else {
            self.labelClient.hidden = true
        }
        
        self.setAttributedTitle(self.labelSolutionTypes, prefix: Constants.LabelPrefix.SolutionTypes, content: self.project.solutionTypes.joinWithSeparator(", "))
        self.labelSolutionTypes.hidden = self.project.solutionTypes.isEmpty
        
        self.setAttributedTitle(self.labelTechnologies, prefix: Constants.LabelPrefix.Technologies, content: self.project.technologies.joinWithSeparator(", "))
        self.labelTechnologies.hidden = self.project.technologies.isEmpty
    }
    
    func setAttributedTitle(label: UILabel, prefix: String, content: String) {
        let mutableText = NSMutableAttributedString(string: prefix + content)
        mutableText.addAttribute(NSFontAttributeName, value: UIFont.boldSystemFontOfSize(16.0), range: NSMakeRange(0, prefix.characters.count))
        label.attributedText = mutableText
    }
    
    func showMoviePlayerForURLString(url: String) {
        if let string = url.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet()) {
            let player = MPMoviePlayerViewController(contentURL: NSURL(string: string))
            player.moviePlayer.scalingMode = .AspectFit
            player.moviePlayer.controlStyle = .Fullscreen
            self.presentMoviePlayerViewControllerAnimated(player)
            player.moviePlayer.play()
        }
    }
    
    func showGallery(item: Asset) {
        if let galleryController = self.storyboard?.instantiateViewControllerWithIdentifier("AssetsGalleryViewController") as? AssetsGalleryViewController {
            galleryController.assets = self.dataSource.assets.filter({ (asset) -> Bool in
                return asset.type == .Image
            })
            if let index = galleryController.assets.indexOf(item) {
                galleryController.startingItem = index
            }
            self.presentViewController(galleryController, animated: true, completion: { 
                
            })
        }
    }

    //MARK: - Collection view delegate
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let asset = self.dataSource.assets[indexPath.item]
        switch asset.type {
        case .Movie:
            self.showMoviePlayerForURLString(asset.urlString)
        case .Image:
            self.showGallery(asset)
        default:
            print("Document selected")
        }
    }
    
    

}
