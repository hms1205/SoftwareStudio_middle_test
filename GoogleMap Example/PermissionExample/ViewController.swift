//
//  ViewController.swift
//  PermissionExample
//
//  Created by User on 2021/03/30.
//

import UIKit
import CoreLocation
import GoogleMaps

class ViewController: UIViewController {
    
    @IBOutlet weak var resultStatusLabel: UILabel!

    private let locationManager:CLLocationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lat = 35.144792901569005
        let lng = 129.01075261903821
        
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: lng, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        self.view.addSubview(mapView)

        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        marker.title = "동서대학교"
        marker.snippet = "iOS 소프트웨어 수업"
        marker.map = mapView
    }
    
    @IBAction func touchUpReqPermissionButton(_ sender: Any) {
        // iOS 14 이상
//        let status = locationManager.authorizationStatus
        let status = CLLocationManager.authorizationStatus()
        
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            print("허용")
            resultStatusLabel.text = "허용"
        case .denied:
            print("권한 거절")
            resultStatusLabel.text = "권한 거절"
        case .notDetermined:
            print("알 수 없음/권한 미선택")
            locationManager.requestWhenInUseAuthorization()
            resultStatusLabel.text = "알 수 없음/권한 미선택"
        default:
            print("권한 차단")
            resultStatusLabel.text = "알 수 없음/권한 미선택"
        }
    }
}
