//
//  HomeCell .swift
//  share_meal
//
//  Created by neal on 15/6/26.
//  Copyright (c) 2015年 neal. All rights reserved.
//

import Foundation
import UIKit
class HomeCell: UITableViewCell{
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var poster: UIImageView!
    
    
    internal var aspectConstraint : NSLayoutConstraint? {
        didSet {
            if oldValue != nil {
                poster.removeConstraint(oldValue!)
            }
            if aspectConstraint != nil {
                poster.addConstraint(aspectConstraint!)
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        aspectConstraint = nil
    }
    
    func setPostedImage(image : UIImage) {
        
        let aspect = image.size.width / image.size.height
        
        aspectConstraint = NSLayoutConstraint(item: poster, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: poster, attribute: NSLayoutAttribute.Height, multiplier: aspect, constant: 0.0)
        
        poster.image = image
    }
}
