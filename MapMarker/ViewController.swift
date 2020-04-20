//
//  ViewController.swift
//  Crossroads Finder
//
//  Created by Brandon Adiele on 3/23/20.
//  Copyright © 2020 Brandon Adiele. All rights reserved.
//

import MapKit
import UIKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var crossroadsLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    let CrossroadsLat = 34.0240892
    let CrossroadsLong = -118.4747321
    
    let MountFujiLat = 35.358
    let MountFujiLong = 138.731
    
    let UPennLat = 39.95
    let UpennLong = -75.19
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mapView.delegate = self
        
    }

    @IBAction func crossroadsLocation(_ sender: Any) {
    let point = MKMapPoint(CLLocationCoordinate2D(latitude: CrossroadsLat, longitude: CrossroadsLong))
    let size = MKMapSize(width: 1000, height: 1000)
    let rect = MKMapRect(origin: point, size: size)
    mapView.setRegion(MKCoordinateRegion(rect), animated: true)
    }
    
    @IBAction func mountFujiLocation(_ sender: Any) {
   let point = MKMapPoint(CLLocationCoordinate2D(latitude: MountFujiLat, longitude: MountFujiLong))
      let size = MKMapSize(width: 1000, height: 1000)
        let rect = MKMapRect(origin: point, size: size);    mapView.setRegion(MKCoordinateRegion(rect), animated: true)
    }
    
    @IBAction func upennLocation(_ sender: Any) {
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
        let factor = pow(2, exp)
        let region = mapView.region
        let newLat = region.span.latitudeDelta * pow(2, exp)
        let newLong = region.span.longitudeDelta * pow(2, exp)
        let newCoordinateSpan = MKCoordinateSpan(latitudeDelta: newLat, longitudeDelta: newLong)
        let newRegion = MKCoordinateRegion(center: region.center, span: newCoordinateSpan)
        mapView.setRegion(newRegion, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        
        let rect = mapView.visibleMapRect
        
        let crossroadsLocation = CLLocationCoordinate2D(latitude: CrossroadsLat, longitude: CrossroadsLong)
        let crossroadsPoint = MKMapPoint(crossroadsLocation)
       
        let mountFujiLocation = CLLocationCoordinate2D(latitude: MountFujiLat, longitude: MountFujiLong)
        let mountFujiPoint = MKMapPoint(mountFujiLocation)
       
        let upennLocation = CLLocationCoordinate2D(latitude: UPennLat, longitude: UpennLong)
        let upennPoint = MKMapPoint(upennLocation)
       
        if rect.contains(crossroadsPoint) {
            crossroadsLabel.text = "Let's go Roads!"
        } else if rect.contains(mountFujiPoint){
            crossroadsLabel.text = "Mount Fuji!"
        } else if rect.contains(upennPoint){
            crossroadsLabel.text = "Let's go Quakers!"
        } else {
            crossroadsLabel.text = " "
        }
    
        
    }
}

