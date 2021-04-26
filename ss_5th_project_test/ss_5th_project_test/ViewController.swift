// command + shift + o -> info.plist 검색 -> Privacy - Location When In Use Usage Description 추가 -> 오른쪽에 위치 권한이 필요합니다 설명 작성

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var resultStatusLabel: UILabel!
    
    private let locationManager:CLLocationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchUpReqPermissionButton(_ sender: Any) {
        
        let status = locationManager.authorizationStatus
        
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            print("허용")
            resultStatusLabel.text = "허용"
        case .denied:
            print("권한 거절")
            resultStatusLabel.text = "권한 거절"
        case .notDetermined:
            print("알 수 없음/ 권한 미선택")
            locationManager.requestWhenInUseAuthorization()
            resultStatusLabel.text = "알 수 없음/ 권한 미선택"
            
        default:
            print("권한 차단")
            resultStatusLabel.text = "권한 차단"
            
        }
        
    }
    
}

