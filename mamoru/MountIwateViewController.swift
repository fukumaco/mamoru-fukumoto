//
//  MountIwateViewController.swift
//  mamoru
//
//  Created by Fukumoto Asako on 2023/09/15.
//

import UIKit
import MapKit

/*import MapKit

let iwateMountain = CLLocationCoordinate2D(latitude: 39.8526, longitude: 141.0010)
let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
let region = MKCoordinateRegion(center: iwateMountain, span: span)

let mapView = MKMapView(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
mapView.setRegion(region, animated: true)

*/
class MountIwateViewController: UIViewController {
    @IBOutlet weak var mountIwate: MKMapView!
        override func viewDidLoad() {
            super.viewDidLoad()
            let iwateLocation = CLLocationCoordinate2D(latitude: 39.8526, longitude: 141.0010)
            let iwateAnnotation = MKPointAnnotation()
            iwateAnnotation.coordinate = iwateLocation
            iwateAnnotation.title = "Mount Iwate"
            mountIwate.addAnnotation(iwateAnnotation)
        }

        // Do any additional setup after loading the view.
    }
    

