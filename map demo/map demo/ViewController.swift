//
//  ViewController.swift
//  map demo
//
//  Created by James Carthew on 19/01/2016.
//  Copyright © 2016 spacemonkey. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var map: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var latitude:CLLocationDegrees = 37.8
        var longitude:CLLocationDegrees = -122.3 //this should be Oakland
        
        var latDelta:CLLocationDegrees = 0.5 // the difference of latitudes from one side of the screen to the other
        var lonDelta:CLLocationDegrees = 0.5
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        map.setRegion(region, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

