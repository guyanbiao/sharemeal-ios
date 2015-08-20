//
//  CustomHttp.swift
//  abc
//
//  Created by neal on 15-3-10.
//  Copyright (c) 2015年 neal. All rights reserved.
//

import Foundation
import SwiftHTTP


class CustomHTTP {
    
    
    class func POST(url: String, params: Dictionary<String, AnyObject>, block: (HTTPResponse) -> Void){
        var request = HTTPTask()
        var token = NSUserDefaults.standardUserDefaults().objectForKey("token") as! String
        var f_params = Dictionary<String, AnyObject>()
        for (k, v) in params {
            f_params.updateValue(v, forKey: k)
        }
        f_params["user_token"] = token
        
        request.POST("\(Server_url + url).json", parameters: f_params, completionHandler:
             { (response: HTTPResponse) in
                if response.responseObject != nil {
                    block(response)
                    
                }
        })
    }
    
    class func GET(url: String, params: Dictionary<String, AnyObject>, block: (HTTPResponse) -> Void){
        var request = HTTPTask()
        var f_params = Dictionary<String, AnyObject>()
        for (k, v) in params {
            f_params.updateValue(v, forKey: k)
        }
        if ((NSUserDefaults.standardUserDefaults().objectForKey("token")) != nil)
        {
            var token = NSUserDefaults.standardUserDefaults().objectForKey("token") as! String
            f_params["user_token"] = token
        }
        request.GET("\(Server_url + url).json", parameters: f_params, completionHandler: { (response: HTTPResponse) in
            if response.responseObject != nil {
                block(response)
            }
        })
    }
}
