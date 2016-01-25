//
//  ViewController.swift
//  whereAmI
//
//  Created by James Carthew on 20/01/2016.
//  Copyright © 2016 spacemonkey. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet var latitudeLabel: UILabel!
    @IBOutlet var altitudeLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var speedLabel: UILabel!
    @IBOutlet var courseLabel: UILabel!
    @IBOutlet var longitudeLabel: UILabel!
    var locationManager:CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation: CLLocation = locations[0]
        self.latitudeLabel.text = "\(userLocation.coordinate.latitude)"
        self.longitudeLabel.text = "\(userLocation.coordinate.longitude)"
        self.courseLabel.text = "\(userLocation.course)"
        self.speedLabel.text = "\(userLocation.speed)"
        self.altitudeLabel.text = "\(userLocation.altitude)"
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(userLocation, completionHandler: { (placemarks, error) -> Void in
            if error != nil {
                print(error)
            } else {
                if let p:CLPlacemark = placemarks![0] {
                    print(p)
                    var subfare:String = ""
                    if p.subThoroughfare != nil {
                        subfare = p.subThoroughfare!
                    }
                    self.addressLabel.text = "\(subfare) \n\(p.thoroughfare!) \n\(p.subLocality!) \n\(p.subAdministrativeArea!) \n\(p.postalCode!) \n\(p.country!)"
                }
                
            }
        })
    }


}

