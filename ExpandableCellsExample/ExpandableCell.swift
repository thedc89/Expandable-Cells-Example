//
//  ExpandableCell.swift
//  ExpandableCellsExample
//
//  Created by DC on 28.08.2016.
//  Copyright © 2016 Dawid Cedrych. All rights reserved.
//

import UIKit

class ExpandableCell: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
  

    @IBOutlet weak var imgHeightConstraint: NSLayoutConstraint!

    var isExpanded:Bool = false
        {
        didSet
        {
            if !isExpanded {
                self.imgHeightConstraint.constant = 0.0
                
            } else {
                self.imgHeightConstraint.constant = 128.0
            }
        }
    }

}
