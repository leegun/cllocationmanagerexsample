//
//  ViewController.swift
//  CLLocationExsample
//
//  Created by Lee Geunil on 2016/02/21.
//  Copyright © 2016年 Lee Geunil. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    var lm : CLLocationManager! = nil
    var longitude : CLLocationDegrees!
    var latitude : CLLocationDegrees!
    
    @IBOutlet weak var longitudeField: UITextField!
    @IBOutlet weak var latitudeField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        longitude = 0.0
        latitude = 0.0
        longitudeField.text = String(longitude)
        latitudeField.text = String(latitude)

        lm = CLLocationManager()
        lm.delegate = self
        lm.requestAlwaysAuthorization()
        lm.desiredAccuracy = kCLLocationAccuracyBest
        lm.distanceFilter = 300
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onStartLocation(sender: AnyObject) {
        lm.startUpdatingLocation()
    }

    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        longitude = newLocation.coordinate.longitude
        latitude = newLocation.coordinate.latitude
        longitudeField.text = String(longitude)
        latitudeField.text = String(latitude)
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        NSLog("Error")
    }

}

