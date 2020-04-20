//
//  ViewController.swift
//  Crossroads Finder
//
//  Created by Brandon Adiele on 3/23/20.
//  Copyright © 2020 Brandon Adiele. All rights reserved.
//

import MapKit
import UIKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var crossroadsLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    var locationManager: CLLocationManager!
    
    
    var Lat = 34.029380
    var Long = -118.351640
    
    var place:String = ""
    
    let CrossroadsLat = 34.0240892
    let CrossroadsLong = -118.4747321
    
    let MountFujiLat = 35.358
    let MountFujiLong = 138.731
    
    let UPennLat = 39.95
    let UpennLong = -75.19
    
    override func viewDidLoad() {
        super.viewDidLoad()
        place = "void"
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        // Do any additional setup after loading the view.
        mapView.delegate = self
        let point = MKMapPoint(CLLocationCoordinate2D(latitude: Lat, longitude: Long))
        let size = MKMapSize(width: 1000, height: 1000)
        let rect = MKMapRect(origin: point, size: size)
        mapView.setRegion(MKCoordinateRegion(rect), animated: true)
    }
    
    @IBAction func crossroadsLocation(_ sender: Any) {
        place = "crossroads"
        let point = MKMapPoint(CLLocationCoordinate2D(latitude: CrossroadsLat, longitude: CrossroadsLong))
        let size = MKMapSize(width: 1000, height: 1000)
        let rect = MKMapRect(origin: point, size: size)
        mapView.setRegion(MKCoordinateRegion(rect), animated: true)
    }
    
    @IBAction func mountFujiLocation(_ sender: Any) {
        place = "Mount Fuji"
        let point = MKMapPoint(CLLocationCoordinate2D(latitude: MountFujiLat, longitude: MountFujiLong))
        let size = MKMapSize(width: 1000, height: 1000)
        let rect = MKMapRect(origin: point, size: size);    mapView.setRegion(MKCoordinateRegion(rect), animated: true)
    }
    
    @IBAction func upennLocation(_ sender: Any) {
        place = "UPenn"
        let point = MKMapPoint(CLLocationCoordinate2D(latitude: UPennLat, longitude: UpennLong))
        let size = MKMapSize(width: 1000, height: 1000)
        let rect = MKMapRect(origin: point, size: size);    mapView.setRegion(MKCoordinateRegion(rect), animated: true)
    }
    
    
    @IBAction func zoomOut(_ sender: Any) {
        Zoom(1)
    }
    
    @IBAction func zoomIn(_ sender: Any) {
        Zoom(-1)
    }
    
    func Zoom(_ exp: Double) {
        /*
         // Uses MKMapRect to create and set region
         let factor = pow(2, exp)
         let rect = mapView.visibleMapRect
         let newSize = MKMapSize(width: rect.width * factor, height: rect.height * factor)
         let newRect = MKMapRect(origin: rect.origin, size: newSize)
         mapView.setRegion(MKCoordinateRegion(rect), animated: true)
         */
        // Uses MKCoordinateSpan to create and set region
        let region = mapView.region
        let newLat = region.span.latitudeDelta * pow(2, exp)
        let newLong = region.span.longitudeDelta * pow(2, exp)
        let newCoordinateSpan = MKCoordinateSpan(latitudeDelta: newLat, longitudeDelta: newLong)
        let newRegion = MKCoordinateRegion(center: region.center, span: newCoordinateSpan)
        mapView.setRegion(newRegion, animated: true)
    }
    
    @IBAction func currentPosition(_ sender: Any) {
        locationManager.requestLocation()
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        
        let rect = mapView.visibleMapRect
        
        let crossroadsLocation = CLLocationCoordinate2D(latitude: CrossroadsLat, longitude: CrossroadsLong)
        let crossroadsPoint = MKMapPoint(crossroadsLocation)
        
        let mountFujiLocation = CLLocationCoordinate2D(latitude: MountFujiLat, longitude: MountFujiLong)
        let mountFujiPoint = MKMapPoint(mountFujiLocation)
        
        let upennLocation = CLLocationCoordinate2D(latitude: UPennLat, longitude: UpennLong)
        let upennPoint = MKMapPoint(upennLocation)
        
        let homeLocation = CLLocationCoordinate2D(latitude: Lat, longitude: Long)
        let currentPoint = MKMapPoint(homeLocation)
        
        if rect.contains(crossroadsPoint) {
            crossroadsLabel.text = "Let's go Roads!"
        } else if rect.contains(mountFujiPoint){
            crossroadsLabel.text = "Mount Fuji!"
        } else if rect.contains(upennPoint){
            crossroadsLabel.text = "Let's go Quakers!"
        } else if rect.contains(currentPoint){
            crossroadsLabel.text = "That's Brandon's home!"
        } else {
            crossroadsLabel.text = "You're not at a relevant place"
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let span = mapView.region.span
        let coords = locations.suffix(1)[0].coordinate
        let newRegion = MKCoordinateRegion(center: coords, span: span)
        mapView.setRegion(newRegion, animated: true)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
}


