//
//  ProjectAssetCollectionViewCell.swift
//  iOSTestApp
//
//  Created by X-User on 5/13/16.
//  Copyright © 2016 Zakhar Kozlov. All rights reserved.
//

import UIKit
import SDWebImage

class ProjectAssetCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func update(asset: Asset) {
        switch asset.type {
        case .Image:
            if asset.urlString.hasSuffix(".db") {
                self.imageView.image = UIImage(named: "Document")
            } else if let string = asset.urlString.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet()) {
                self.imageView.sd_setImageWithURL(NSURL(string: string))
            } else {
                self.imageView.image = UIImage(named: "Document")
            }
        case .Movie:
            self.imageView.image = UIImage(named: "Movie")
        case .Document:
            self.imageView.image = UIImage(named: "Document")
        }
    }

}
