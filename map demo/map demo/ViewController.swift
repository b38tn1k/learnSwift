//
//  ViewController.swift
//  map demo
//
//  Created by James Carthew on 19/01/2016.
//  Copyright © 2016 spacemonkey. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet var map: MKMapView!
    var locationManager = CLLocationManager()
    
    
    func myAction(gestureRecogniser:UIGestureRecognizer) {
        print("Gesture Recognised")
        let touchPoint = gestureRecogniser.locationInView(self.map)
        let newCoordinate: CLLocationCoordinate2D = map.convertPoint(touchPoint, toCoordinateFromView: self.map)
        let annotation = MKPointAnnotation()
        annotation.coordinate = newCoordinate
        annotation.title = "New Place"
        annotation.subtitle = "this is a new place that I clicked upon"
        self.map.addAnnotation(annotation)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        let userLocation = locations[0]
        let latitude = userLocation.coordinate.latitude
        let longitude = userLocation.coordinate.longitude
        let latDelta:CLLocationDegrees = 0.05 // the difference of latitudes from one side of the screen to the other
        let lonDelta:CLLocationDegrees = 0.05
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        self.map.setRegion(region, animated: true)
        // create an annotation
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Oakland"
        annotation.subtitle = "I live near here"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        // set the screen view / region displayed on the map
        let latitude:CLLocationDegrees = 37.8
        let longitude:CLLocationDegrees = -122.3 //this should be Oakland
        let latDelta:CLLocationDegrees = 0.5 // the difference of latitudes from one side of the screen to the other
        let lonDelta:CLLocationDegrees = 0.5
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        map.setRegion(region, animated: true)
        // create an annotation
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Oakland"
        annotation.subtitle = "I live near here"
        map.addAnnotation(annotation)
        let longGesture = UILongPressGestureRecognizer(target: self, action: "myAction:") // the colon is here to ensure arguements are sent to myAction
        longGesture.minimumPressDuration = 0.5
        map.addGestureRecognizer(longGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

