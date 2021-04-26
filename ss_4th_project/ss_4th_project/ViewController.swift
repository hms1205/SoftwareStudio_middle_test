//4주차

// 1. UIAlertController에 대한 이해

// UIAlertController
// - 안드로이드의 Alert Dialog와 유사
// - 경고, 확인창을 표시할 때 사용
// - 알림 스타일은 actionSheet, alert 2가지가 있음


// UIAlertController 프로퍼티
// title = 경고창 제목
// message = 경고창에 표시할 내용
// action = 경고 혹은 액션시트에 추가할 액션
// preferredStyle = 경고창 스타일 (alert, actionSheet 중 택 1)


// ActionSheet
// - 두 개 이상의 선택사항을 제공하는 경고 스타일
// - 하단에서 위로 미끄러짐

// Alert
// - 일반적인 경고 스타일
// - 중요한 작업을 하기 전에 표시

// UIAlertAction
// - 사용자가 경고 또는 액션시트에서 사용할 버튼과 버튼을 클릭했을 때 수행할 작업 구성

// UIAlertAction 프로퍼티
// title = 액션 제목
// style = 액션 스타일
// isEnabled = 액션 사용 가능 여부

// UIAlertAction 스타일
// default = 기본 스타일
// cancel = 작업을 취소하거나 변경사항이 없을 경우
// destructive = 데이터가 변경되거나 삭제되어 돌이킬 수 없을 경우

// -----------------------------실습-----------------------------

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchUpAlertButton(_ sender: Any) {
        let alertController = UIAlertController(title: "삭제", message: "정말 삭제하시겠습니까?", preferredStyle: .alert)
        let deleteAction = UIAlertAction(title: "삭제", style: .destructive) {
            (action:UIAlertAction) in
            print("삭제")
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel) { (action:UIAlertAction) in
            print("취소")
        }
        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func touchUpActionSheetButton(_ sender: Any) {
        let alertController = UIAlertController(title: "삭제", message: "정말 삭제하시겠습니까?", preferredStyle: .actionSheet)
        let deleteAction = UIAlertAction(title: "삭제", style: .destructive) {
            (action:UIAlertAction) in
            print("삭제")
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel) { (action:UIAlertAction) in
            print("취소")
        }
        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}

