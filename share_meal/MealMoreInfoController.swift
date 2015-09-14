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
import SwiftHTTP

class MealMoreInfoController: UIViewController, UIScrollViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var mealTime: UITextField!
    @IBOutlet weak var personLimit: UITextField!

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    var id: String!
    override func viewDidLoad() {
        self.title = "详细信息"
        self.navigationController?.navigationBar.translucent = false
        
        scrollView.delegate = self;
        scrollView.scrollEnabled = true;

    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.imageView.contentMode = .ScaleAspectFit
            self.imageView.image = pickedImage
            let imageData:NSData = UIImageJPEGRepresentation(pickedImage, 100)
            
            CustomHTTP.POST("/meals/upload", params: ["aParam": "aValue", "file": HTTPUpload(data: imageData, fileName: "abc.jpg", mimeType: "jpg")], block: { (response) -> Void in
                NSLog("")
            })
        }
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func uploadPicture(sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imagePicker.allowsEditing = true
    
        
        self.presentViewController(imagePicker, animated: true,
            completion: nil)
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
