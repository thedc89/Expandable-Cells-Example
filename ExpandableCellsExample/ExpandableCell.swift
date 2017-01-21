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

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//        
//        self.imgHeightConstraint.constant = selected ? 128.0 : 0.0
//    }
    
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
