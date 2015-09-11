//
//  MealMoreInfo.swift
//  share_meal
//
//  Created by neal on 15/9/10.
//  Copyright (c) 2015年 neal. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class MealMoreInfoController: UIViewController {
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var mealTime: UITextField!
    @IBOutlet weak var personLimit: UITextField!

    var id: String!
    override func viewDidLoad() {
        self.title = "详细信息"
        self.navigationController?.navigationBar.translucent = false

    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    @IBAction func nextView(sender: AnyObject) {
        CustomHTTP.POST("/meals/add_more_info", params: ["meal": ["meal_time": mealTime.text, "person_limit": personLimit.text, "price": price.text], "id": id]) { (response) -> Void in
            let json = JSON(data: response.responseObject as! NSData)

            NSLog(json.description)
            

            if (response.error == nil) {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.navigationController?.popToRootViewControllerAnimated(true)
                    return
                })
            }
            
        }
    }
}
