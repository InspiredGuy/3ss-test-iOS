//
//  ProjectTableViewCell.swift
//  iOSTestApp
//
//  Created by X-User on 5/11/16.
//  Copyright © 2016 Zakhar Kozlov. All rights reserved.
//

import UIKit

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
    
    func update(title: String, year: Int, solutions: [String], imageURLString: String) {
        self.labelTitle.text = title
        self.labelYear.text = "\(year)"
        self.labelSolutions.text = solutions.joinWithSeparator(", ")
        // TODO : download image asynchronously
    }
    
}
