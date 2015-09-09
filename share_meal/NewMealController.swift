//
//  NewMealController.swift
//  share_meal
//
//  Created by neal on 15/8/31.
//  Copyright (c) 2015年 neal. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class NewMealController: UIViewController,  MKMapViewDelegate, UIGestureRecognizerDelegate  {
    @IBOutlet weak var mapView: MKMapView!
    
    var centerAnnotation: MKPointAnnotation = MKPointAnnotation()
    override func viewDidLoad() {
        self.title = "开饭"
        mapView.delegate = self
//        let location = CLLocationCoordinate2D(
//            latitude: 51.50007773,
//            longitude: -0.1246402
//        )
//        // 2
//        let span = MKCoordinateSpanMake(0.05, 0.05)
//        let region = MKCoordinateRegion(center: location, span: span)
//        mapView.setRegion(region, animated: true)
//        
//        //3
//        let annotation = MKPointAnnotation()
//        annotation.coordinate = location
//        annotation.title = "Big Ben"
//        annotation.subtitle = "London"
//        mapView.addAnnotation(annotation)
        
        var pa = MKPointAnnotation()
        pa.coordinate = mapView.centerCoordinate;
        pa.title = "Map Center"
        pa.subtitle = "sss"
        mapView.addAnnotation(pa)
        self.centerAnnotation = pa;
        
        var panGesture = UIPanGestureRecognizer(target: self, action: "handleGesture:")
        panGesture.delegate = self;
        mapView.addGestureRecognizer(panGesture)
        
        var pinchGesture = UIPinchGestureRecognizer(target: self, action: "handleGesture:")
        pinchGesture.delegate = self;
        mapView.addGestureRecognizer(pinchGesture)
    }
    
    func handleGesture(gestureRecognizer: UIGestureRecognizer)
    {
        centerAnnotation.coordinate = mapView.centerCoordinate;
    }
    

    
    func gestureRecognizer(UIGestureRecognizer,
        shouldRecognizeSimultaneouslyWithGestureRecognizer:UIGestureRecognizer) -> Bool {
            return true
    }
    
    func mapView(mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        centerAnnotation.coordinate = mapView.centerCoordinate;

        NSLog("\(centerAnnotation.coordinate.latitude)")
    }
    
    
}

