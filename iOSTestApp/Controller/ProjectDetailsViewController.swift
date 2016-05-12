//
//  ProjectDetailsViewController.swift
//  iOSTestApp
//
//  Created by X-User on 5/11/16.
//  Copyright © 2016 Zakhar Kozlov. All rights reserved.
//

import UIKit

class ProjectDetailsViewController: UIViewController {
    
    @IBOutlet weak var imageViewLogo: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelYear: UILabel!
    @IBOutlet weak var labelSupportedScreens: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelClient: UILabel!
    @IBOutlet weak var labelSolutionTypes: UILabel!
    @IBOutlet weak var labelTechnologies: UILabel!
    @IBOutlet weak var collectionViewAssets: UICollectionView!
    
    @IBOutlet weak var scrollViewWrap: UIScrollView!
    @IBOutlet weak var viewContentWrap: UIView!
    
    var project : Project!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        self.imageViewLogo.sd_setImageWithURL(NSURL(string: self.project.imageURLString))
        
        self.labelTitle.text = self.project.name
        self.labelYear.text = "\(self.project.year)"
        self.labelYear.hidden = (self.project.year == 0)
        
        self.labelSupportedScreens.text = self.project.supportedScreens.joinWithSeparator(", ")
        self.labelSupportedScreens.hidden = self.project.supportedScreens.isEmpty
        
        self.labelDescription.text = self.project.descriptionText
        self.labelDescription.hidden = (self.project.descriptionText == "")
        
        //TODO: make attributed client, solution types, technologies
        //TODO: fetch client info
        self.labelClient.text = "Client: \(self.project.clientId)"
        self.labelClient.hidden = (self.project.clientId == 0)
        
        self.labelSolutionTypes.text = "Solution types: \(self.project.solutionTypes.joinWithSeparator(", "))"
        self.labelSolutionTypes.hidden = self.project.solutionTypes.isEmpty
        
        self.labelTechnologies.text = "Technologies: \(self.project.technologies.joinWithSeparator(", "))"
        self.labelTechnologies.hidden = self.project.technologies.isEmpty
        
        
        
    }

}
