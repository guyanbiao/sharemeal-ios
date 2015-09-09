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
import CoreLocation

class NewMealController: UIViewController,  MKMapViewDelegate, UIGestureRecognizerDelegate, CLLocationManagerDelegate  {
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var inputText: UITextField!
    
    var centerAnnotation: MKPointAnnotation = MKPointAnnotation()
    var manager:CLLocationManager!
    
    
    @IBAction func search(sender: AnyObject) {
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(inputText.text, completionHandler: { (placemarks, error) -> Void in
            if error != nil {
                println(error)
                return
            }
            if placemarks != nil && placemarks.count > 0 {
                let placemark = placemarks[0] as! CLPlacemark
                let span = MKCoordinateSpanMake(0.05, 0.05)
                let location = CLLocationCoordinate2D(
                    latitude: placemark.location.coordinate.latitude,
                    longitude: placemark.location.coordinate.longitude
                )
                let region = MKCoordinateRegion(center: location, span: span)
                self.mapView.setRegion(region, animated: true)
            }
        })
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
 
    @IBAction func nextView(sender: AnyObject) {
        CustomHTTP.POST("meals/create_location", params: ["lat": centerAnnotation.coordinate.latitude, "lng": centerAnnotation.coordinate.longitude]) { (response) -> Void in
            NSLog(response.description)
        }
    }
    
   
    override func viewDidLoad() {
        
        self.title = "开饭"
        mapView.delegate = self
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
        
        
        manager = CLLocationManager()
        manager.delegate = self;

        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
        
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        var userLocation:CLLocation = locations[0] as! CLLocation
        let long = userLocation.coordinate.longitude;
        let lat = userLocation.coordinate.latitude;
        NSLog(lat.description + "*************************")
        manager.stopUpdatingLocation()
        
        let location = CLLocationCoordinate2D(
            latitude: lat,
            longitude: long
        )
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
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

