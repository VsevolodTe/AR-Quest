//
//  ViewController.swift
//  AR Quest
//
//  Created by Denis Bystruev on 21/12/2018.
//  Copyright © 2018 Denis Bystruev. All rights reserved.
//

import MapKit
import UIKit

class MapViewController: UIViewController {
    var prizes: [PrizeObject]?
    @IBOutlet weak var mapView: MKMapView!
    
    let prize = PrizeObject(
        coordinate: CLLocationCoordinate2D(latitude: 55.77, longitude: 37.47),
        title: "Хорошкола",
        subtitle: "Народного ополчения, 9А"
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showPins()
    }
    
    func showPins() {
        //        let pin = MKPinAnnotationView(annotation: prize, reuseIdentifier: "pin")
        
        let region = MKCoordinateRegion(center: prize.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        
        mapView.addAnnotation(region, animated: true)
        
        mapView.addAnnotation(prize)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        guard let touch = touches.first else { return }
        
        let location = touch.location(in: mapView)
        
        let coordinate = mapView.convert(location, toCoordinateFrom: mapView)
        
        let region = mapView.region
        
        print(#function, coordinate, region)
        
        print(#function, touches)
    }
}
