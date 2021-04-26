// 3주차

// UIImageView
// -> 안드로이드의 ImageView와 같은 기능
// -> 이미지를 넣기 위한 뷰

// 이미지 표시 방법
// -> Scale To Fill
// 이미지가 꽉 채워져서 보여짐
// 이미지 비율을 무시하고 그림을 넣음

// -> Aspect Fit
// 위 아래가 이미지 비율에 따라서 맞춰짐
// 이미지 비율을 유지한 채로 이미지 삽입
// 비율이 맞지 않을 경우 내부에 여백이 발생

// -> Aspect Fill
// 공간보다 더 크게 보임
// 이미지 비율을 유지한 채로 이미지 삽입하지만 그림이 잘리게 됨
// Clips to Bounds를 Yes로 하면 그림이 잘려서 나오지 않게 됨
// 인물, 동물 사진에는 적합하지 않음

// -> Redraw
// 많이 사용하지 않음

// 에셋(Assets)
// -> 안드로이드의 Drawable/Raw과 유사
// -> 이미지 파일, mp3, json파일 등 다양한 파일을 삽입할 수 있음

// [1] AutoLayout 부터
// 1. Assets.xcassets 에 이미지 삽입
// 2. 바탕화면에 이미지 다운
// 3. 왼쪽 아래 + 버튼을 누르고 Image Set 클릭
// 4. 3가지 칸이 나오는데, 그림을 드래그로 옮김 (기기에 따른 칸임)
// 5. 과정을 줄이고 싶다면 그냥 폴더 안에 이미지를 드래그
// 6. 이름 바꿀 수 있음
// 7. 하나의 이미지로만 하고 싶으면 Set -> Scales -> Single Scale 변경
// 8. 스토리보드 이미지 뷰 선택 -> 오른쪽 설정 Image -> food 선택

// [2] Main Login
// 1. 스토리보드 + 누르고 Image View 추가
// 2. 가로, 세로 150 / x, y축 정중앙
// 3. 회원가입, 로그인 버튼
// 4. 하단 버튼 2개 생성
// 5. 오토레이아웃, 스택뷰 두가지 방법이 있음 -> 스택뷰로
// 6. Vertical Stack View 삽입 (세로 배열)
// 7. 버튼들을 스택뷰로 넣는다
// 8. 스택뷰 - AutoLayout, 좌측 우측 하단 20씩 (원래는 위에도 해줘야 함)
// 9. 버튼 백그라운드 색 파랑, 빨강으로 바꾸기 / 글자 색 흰색 / 회원가입, 로그인 글자 변경
// 10. 버튼 사이 공간 만들기
// 11. Stack View 설정 - Spacing 10정도 설정

// [3] Image View에 Image 삽입
// 1. [1]의 방법 사용
// 2. Single Scale로
// 3. 이미지 변경
// 4. Scale To Fill 사용하여 이미지 꽉채움

// [4] ID, PW 생성
// 1. Label, Text Field 추가
// 2. Horizotal Stack View 추가 (가로 배열)
// 3. Stack View 안에 Label, Text Field 넣기
// 4. Vertical Stack View 를 Horizotal Stack View가 포함되게 추가
// 5. Label 조정 - 넓이(가로) 50
// 6. Horizotal Stack View 복사
// 7. Vertical Stack View (Horizotal 두개 포함되어 있는) AutoLayout 설정
// 8. 좌측 우측 상단 20씩
// 9. Vertical Stack View 클릭 후 우측 설정에 삼각형 모양 설정 클릭
// 10. Viertical 부분 클릭 -> 이미지 하단으로 넣기 위해 기준점을 바꿈
// 11. Second item -> food top 선택 -> Top을 Bottom으로 선택
// 12. Constant 20으로 변경 (음시 사진 하단을 기준으로 스택 뷰 상단을 기준으로 20씩 띄워라)
// 13. Vertical Stack View 클릭 -> Spacing 10 부여 -> Label 이름 ID, PW 변경
// 14. Text Field 선택 후 Placeholder 부분에 Input your ID, PW 적기

// -> 휴대폰 단말기가 크게 바뀔 경우를 대비해 Autolayout 사용!

// [번외] 세로모드에서만 App이 동작하게 만들기
// 1. 프로젝트 이름 클릭
// 2. General -> Device Orientation 원하는 모드 체크 해제

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

