//
//  MapViewController.swift
//  Clock
//
//  Created by jyd on 2018/10/18.
//  Copyright © 2018年 jyd. All rights reserved.
//
import MapKit
import UIKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mapView.setUserTrackingMode(.follow, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let width = 10000.0
        let height = 10000.0
        let region = MKCoordinateRegion(center: center, latitudinalMeters: width, longitudinalMeters: height)
        mapView.setRegion(region, animated: true)
    }
    

    
    @IBAction func dropPin(_ sender: UIBarButtonItem) {
        let pin = Pin(coordinate: mapView.userLocation.coordinate)
        mapView.addAnnotation(pin)
        
    }
    
}
