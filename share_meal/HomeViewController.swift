//
//  HomeViewController.swift
//  share_meal
//
//  Created by neal on 15/6/25.
//  Copyright (c) 2015年 neal. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    var meals: [JSON] = []
    var mycell_height: CGFloat!
    var prototypeCell: HomeCell!

    override func viewDidLoad() {
        tableView.separatorColor = UIColor(red:
            240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0,
            alpha: 0.8)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        tableView.registerNib(UINib(nibName: "HomeCell", bundle: nil), forCellReuseIdentifier: "CustomCellOne")
        self.tableView.dataSource  = self
        self.tableView.delegate  = self
        
        CustomHTTP.GET("/meals", params: Dictionary(),  block: { (response) -> Void in
            let json = JSON(data: response.responseObject as! NSData)
            self.meals = json.arrayValue

            dispatch_async(dispatch_get_main_queue()) {
                self.tableView.reloadData()
                return
            }
        })
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CustomCellOne", forIndexPath: indexPath) as! HomeCell

        cell.title.text = meals[indexPath.row]["title"].stringValue
        cell.setPostedImage(UIImage(named: "1111")!)
        return cell
    }
 
}


