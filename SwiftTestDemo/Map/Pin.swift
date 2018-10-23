//
//  Pin.swift
//  Clock
//
//  Created by jyd on 2018/10/18.
//  Copyright © 2018年 jyd. All rights reserved.
//
import MapKit
import UIKit

class Pin: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
    

}
