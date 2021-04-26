//
//  ViewController.swift
//  SoStu_middleTerm
//
//  Created by C_Nak on 2021/04/26.
//

//5주차 - 위치 권한 실습 -----------------------------------------------------------------
import UIKit
import CoreLocation

class ViewController: UIViewController {
    //버튼을 눌렀을 때 권한을 요청하고 값에 대한 결과 표시를 위한 코드 (label 연결 설정 (알 수 없음 라벨))
    @IBOutlet weak var resultStatusLabel: UILabel!
    
    private let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //버튼 연결 설정 (위치 권한 요청 버튼)
    @IBAction func touchUpReqPermissionButton(_ sender: Any) {
        //IOS 14이상
        let status = locationManager.authorizationStatus
        //IOS 14미만
        //let status = CLLocationManager.authorizationStatus()
        
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            print("허용")
            resultStatusLabel.text = "허용" //권한 선택 상태 표시
        case .denied:
            print("권한 거절")
            resultStatusLabel.text = "권한 거절"
        case .notDetermined:
            print("알 수 없음 / 권한 미선택") //위치 권한 선택 사용자에게 요청
            locationManager.requestWhenInUseAuthorization()
            resultStatusLabel.text = "알 수 없음 / 권한 미선택"
        default:
            print("권한 차단")
            resultStatusLabel.text = "권한 차단"
        }
    }

}
/*위 코드 작성 후 "NSLocationWhenInUseUsageDescription" 관련 에러 발생 시
command + shift + o 누른 후 info.plist 검색
아무 파일에서 +버튼 누른 후 Privacy - Location When in Use Usage Description 등록, value 값은 "위치 권환이 필요합니다"
 */


//5주차 - CocoPods을 이용한 위치 표시 앱 실습 -----------------------------------------------------------------
/*시작 전 google에서 "google map ios sdk" 검색, Getting Started 클릭, SDK install 진행
 terminal에서 프로젝트 파일 경로에서
sudo gem install cocoapods (에러 발생 시 아래 코드 입력)
sudo gem install cocoapods --source http://rubygems.org
 
이후 프로젝트 파일 클릭, File - new - File, other 란에 Empty 생성, Podfile이라고 명명
 Podfile에
 source 'https://github.com/CocoaPods/Specs.git'
 target 'YOUR_APPLICATION_TARGET_NAME_HERE' do <---- 프로젝트 이름으로 변경하여야 함
    pod 'GoogleMaps', '4.2.0'
    pod 'GooglePlaces', '4.2.0'
 end
 작성,
 이후 terminal에서 pod install
 API 키 얻기,
 이후
 
 AppDelegate.swift에서
 import GooglePlaces 작성,
 func application () 함수 [UIApplication.LaunchOptionsKey: Any] 아래에
 GMSPlacesClient.provideAPIKey("얻어낸 API키") 작성
 이후에 ViewController.swift로 다시 넘어와서
 viewDidLoad() 함수 내 super.viewDidLoad() 아래에
 --------------------------------------------------------------------------------------------
 let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
 let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
 self.view.addSubview(mapView)

 // Creates a marker in the center of the map.
 let marker = GMSMarker()
 marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
 marker.title = "Sydney"
 marker.snippet = "Australia"
 marker.map = mapView
 ---------------------------------------------------------------------------------------------
 작성,
 작성 후 에러 발생시 상단에 import GoogleMaps 작성
 
 이후 프로젝트 폴더에서 info.plist 오른쪽 클릭, Open As -> Source Code 클릭
 소스 파일 맨 밑 </dict> 위에
 <key>LSApplicationQueriesSchemes</key>
 <array>
     <string>googlechromes</string>
     <string>comgooglemaps</string>
 </array>
 삽입
 
 Run 하고나서 GMSServices provideAPIKey 에러가 뜨면
 AppDelegate.swift로 이동하여
 import GoogleMaps 작성,
 GMSPlacesClient.provideAPIKey 작성한 부분 아래에
 GMSServices.provideAPIkey("얻어낸 API키") 작성
 
 위치 표시가 제대로 안되면
 viewController.swift 파일에서
 viewDidLoad() 함수 안에
 let lat = 35.144792901569005
 let lng = 129.01075261903821 작성,
 
 Map SDK for iOS 라이브러리 사용하기 설정 (CocoaPods를 이용한 위치 표시 앱 실습 18:25 참고)
 
 완성 코드----------- * 표시는 실습으로 추가된 코드-----------------------------------------------------
 ------------ViewController.swift---------------------------
 import UIKit
 import CoreLocation
 import GooglePlaces ***
 import GoogleMaps ***

 class ViewController: UIViewController {
     
     @IBOutlet weak var resultStatusLabel: UILabel!
     
     private let locationManager = CLLocationManager()
     
     override func viewDidLoad() {
         super.viewDidLoad()
 *****
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
 *****
     }
     
     @IBAction func touchUpReqPermissionButton(_ sender: Any) {
         //IOS 14이상
         let status = locationManager.authorizationStatus
         //IOS 14미만
         //let status = CLLocationManager.authorizationStatus()
         
         switch status {
         case .authorizedWhenInUse, .authorizedAlways:
             print("허용")
             resultStatusLabel.text = "허용" //권한 선택 상태 표시
         case .denied:
             print("권한 거절")
             resultStatusLabel.text = "권한 거절"
         case .notDetermined:
             print("알 수 없음 / 권한 미선택") //위치 권한 선택 사용자에게 요청
             locationManager.requestWhenInUseAuthorization()
             resultStatusLabel.text = "알 수 없음 / 권한 미선택"
         default:
             print("권한 차단")
             resultStatusLabel.text = "권한 차단"
         }
     }

 }
 
 ------------AppDelegate.swift---------------------------
 import UIKit
 import CoreData
 import GooglePlaces
 import GoogleMaps

 @main
 class AppDelegate: UIResponder, UIApplicationDelegate {



     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
         // Override point for customization after application launch.
         GMSPlacesClient.provideAPIkey("얻어낸 API 키")
         GMSServices.provideAPIKey("얻어낸 API 키")
         
         return true
     }
 이후 코드 쭈르르륵
 */
