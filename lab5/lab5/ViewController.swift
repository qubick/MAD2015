//
//  ViewController.swift
//  lab5
//
//  Created by JeeeunKim on 10/8/15.
//  Copyright (c) 2015 JeeeunKim. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    let span = MKCoordinateSpanMake(0.05, 0.05)
    var locationManager = CLLocationManager()
    var annotation = MKPointAnnotation()
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    func locationManager(manager: CLLocationManager!, didUpdateLocation location: [AnyObject]!) {
        
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake(manager.location.coordinate, span)
        
        mapView.setRegion(region, animated: true)
        
        annotation.coordinate = manager.location.coordinate
        annotation.title = "You are here"
        annotation.subtitle = "Latitue: \(manager.location.coordinate.latitude), Longitude: \(manager.location.coordinate.longitude)"
        
        mapView.addAnnotation(annotation)
    }
    
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        println("didChangeAuth")
        
        if status == CLAuthorizationStatus.AuthorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error:NSError!) {
        var errorType = String()
        
        if let clError = CLError(rawValue: error.code){
            if clError == .Denied {
                errorType = "access denied"
                
                let alert = UIAlertController(title: "Error", message: errorType, preferredStyle: UIAlertControllerStyle.Alert)
                
                let okAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(okAction)
                presentViewController(alert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func btnGoAmsterdam(sender: UIButton) {
        let newlocation = CLLocationCoordinate2D(latitude: 52.370216, longitude: 4.895168)
        let region = MKCoordinateRegionMake(newlocation, span)
        
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = newlocation
        annotation.title = "Amsterdam"
        annotation.subtitle =  "Netherland"
        mapView.addAnnotation(annotation)
    }
    
    @IBAction func btnGoAthenes(sender: UIButton) {
        let newlocation = CLLocationCoordinate2D(latitude: 37.983917, longitude: 23.729360)
        let region = MKCoordinateRegionMake(newlocation, span)
        
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = newlocation
        annotation.title = "Athenes"
        annotation.subtitle =  "Greece"
        mapView.addAnnotation(annotation)
    }
    
    @IBAction func btnGoLondon(sender: UIButton) {
        let newlocation = CLLocationCoordinate2D(latitude: 51.507351, longitude: -0.127758)
        let region = MKCoordinateRegionMake(newlocation, span)
        
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = newlocation
        annotation.title = "London"
        annotation.subtitle =  "United Kingdom"
        mapView.addAnnotation(annotation)
    }
    
    @IBAction func btnGoMoscow(sender: UIButton) {
        let newlocation = CLLocationCoordinate2D(latitude: 55.755826, longitude: 37.617300)
        let region = MKCoordinateRegionMake(newlocation, span)
        
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = newlocation
        annotation.title = "Moscow"
        annotation.subtitle =  "Russia"
        mapView.addAnnotation(annotation)
    }
    
    @IBAction func btnGoParis(sender: UIButton) {
        let newlocation = CLLocationCoordinate2D(latitude: 48.856614, longitude: 2.352222)
        let region = MKCoordinateRegionMake(newlocation, span)
        
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = newlocation
        annotation.title = "Paris"
        annotation.subtitle =  "France"
        mapView.addAnnotation(annotation)
    }
    
    @IBAction func btnGoVatican(sender: UIButton) {
        let newlocation = CLLocationCoordinate2D(latitude: 41.902916, longitude: 12.453389)
        let region = MKCoordinateRegionMake(newlocation, span)
        
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = newlocation
        annotation.title = "Vatican"
        annotation.subtitle =  "Vatican"
        mapView.addAnnotation(annotation)
    }
    
    @IBAction func btnGoHome(sender: UIButton) {
        
        let newlocation = CLLocationCoordinate2D(latitude: 37.615246, longitude: 126.715632)
        let region = MKCoordinateRegionMake(newlocation, span)
        
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = newlocation
        annotation.title = "Home"
        annotation.subtitle =  "Gimpo city, South Korea"
        mapView.addAnnotation(annotation)
        
    }
    
    override func viewDidLoad() {
        /* just for loading default location based on GPS coordinate */
        let location = CLLocationCoordinate2D(latitude: 29.959492, longitude: -90.064887)
        let region = MKCoordinateRegionMake(location, span)
        
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Burbon Street"
        annotation.subtitle =  "New Oleans, LA"
        mapView.addAnnotation(annotation)

        
        mapView.mapType = MKMapType.Standard
        
        var status:CLAuthorizationStatus = CLLocationManager.authorizationStatus()
        if status == CLAuthorizationStatus.NotDetermined {
            locationManager.requestWhenInUseAuthorization()
        }
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        
        mapView.showsUserLocation = true
        
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

