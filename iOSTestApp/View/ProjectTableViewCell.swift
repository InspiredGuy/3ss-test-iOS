//
//  ProjectTableViewCell.swift
//  iOSTestApp
//
//  Created by X-User on 5/11/16.
//  Copyright © 2016 Zakhar Kozlov. All rights reserved.
//

import UIKit
import SDWebImage

class ProjectTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageViewLogo: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelYear: UILabel!
    @IBOutlet weak var labelSolutions: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Update
    
    func update(project: Project) {
        self.labelTitle.text = project.name
        self.labelYear.text = "\(project.year)"
        self.labelYear.hidden = (project.year == 0)
        self.labelSolutions.text = project.solutionTypes.joinWithSeparator(", ")
        self.imageViewLogo.sd_setImageWithURL(NSURL(string: project.imageURLString))
    }
    
}
