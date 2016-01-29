//
//  ViewController.swift
//  Places
//
//  Created by James Carthew on 27/01/2016.
//  Copyright © 2016 spacemonkey. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet var map: MKMapView!
    
    var manager: CLLocationManager!
    
    func action(gestureRecogniser:UIGestureRecognizer) {
        if gestureRecogniser.state == UIGestureRecognizerState.Began {
            let touchPoint = gestureRecogniser.locationInView(self.map)
            let newCoordinate = self.map.convertPoint(touchPoint, toCoordinateFromView: self.map)
            let location = CLLocation(latitude: newCoordinate.latitude, longitude: newCoordinate.longitude)
            CLGeocoder().reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
                var title = ""
                if error == nil {
                    if let p = placemarks?[0] {
                        var subThoroughfare:String = ""
                        var thoroughfare:String = ""
                        if p.subThoroughfare != nil {
                            subThoroughfare = p.subThoroughfare!
                        }
                        if p.thoroughfare != nil {
                            thoroughfare =  p.thoroughfare!
                        }
                        title = "\(subThoroughfare) \(thoroughfare)"
                    }
                    if title == "" {
                        title = "added \(NSDate())"
                    }
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = newCoordinate
                    annotation.title = title
                    self.map.addAnnotation(annotation)
                    myPlaces.append(["name":title, "lat":"\(newCoordinate.latitude)", "long":"\(newCoordinate.longitude)"])
                    
                }
            })
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        if activePlace == -1 {
            manager.requestWhenInUseAuthorization()
            manager.startUpdatingLocation()
        } else {
            let latitude = NSString(string: myPlaces[activePlace]["lat"]!).doubleValue
            let longitude = NSString(string: myPlaces[activePlace]["long"]!).doubleValue
            let name = myPlaces[activePlace]["name"]!
            let coordinate = CLLocationCoordinate2DMake(latitude, longitude)
            let latDelta:CLLocationDegrees = 0.01
            let longDelta:CLLocationDegrees = 0.01
            let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
            let region: MKCoordinateRegion = MKCoordinateRegionMake(coordinate, span)
            map.setRegion(region, animated: true)
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = name
            map.addAnnotation(annotation)

        }
        let uilpgr = UILongPressGestureRecognizer(target: self, action: "action:")
        uilpgr.minimumPressDuration = 0.5
        map.addGestureRecognizer(uilpgr)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation: CLLocation = locations[0]
        let latitude = userLocation.coordinate.latitude
        let longitude = userLocation.coordinate.longitude
        let coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        let latDelta:CLLocationDegrees = 0.01
        let longDelta:CLLocationDegrees = 0.01
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        let region: MKCoordinateRegion = MKCoordinateRegionMake(coordinate, span)
        self.map.setRegion(region, animated: true)
//        print(locations)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

