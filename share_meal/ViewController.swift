//
//  ViewController.swift
//  share_meal
//
//  Created by neal on 15/6/11.
//  Copyright (c) 2015年 neal. All rights reserved.
//

import UIKit
import SwiftHTTP

class ViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func login(sender: AnyObject) {
        NSLog(email.text)
        NSLog(password.text)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }


}

