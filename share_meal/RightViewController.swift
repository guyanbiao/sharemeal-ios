//
//  RightViewController.swift
//  share_meal
//
//  Created by neal on 15/8/31.
//  Copyright (c) 2015年 neal. All rights reserved.
//

import Foundation
import UIKit
class RightViewController: UIViewController {
    var mainViewController: UIViewController!
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    override func viewDidLoad() {
        thumbnailImageView.layer.cornerRadius = thumbnailImageView.frame.size.width / 2
        thumbnailImageView.clipsToBounds = true
    }
    
    @IBAction func shareMeal(sender: AnyObject) {
        NSLog("sss")
        let newMeal = NewMealController(nibName: "NewMealController", bundle: nil)
        self.slideMenuController()?.closeLeft()
        self.mainViewController.navigationController?.pushViewController(newMeal, animated: true)
    }
}