//
//  ViewController.swift
//  Location
//
//  Created by Yonghyeon on 6/7/26.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var locationLabel: UILabel!
    var manager: CLLocationManager = CLLocationManager()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationLabel.text = "Ready!"
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }

        locationLabel.text = "LAT: \(location.coordinate.latitude) | LON: \(location.coordinate.longitude)"
    }

}
