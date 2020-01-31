
import UIKit


// 열거형: 연관된 상수들을 하나의 이름으로 묶은 자료형.
// 열거형은 독립적
// 열거형을 사용하는 이유: 코드의 안정성과 안정성이 높아진다.


// 열거형을 사용하지 않는 경우

let left = 0
let center = 1
let right = 2

var alignment = center

// 열거형을 사용하지 않을 때 문제점
// 0, 1, 2가 어떻게 사용되는지 알 수 없다.
// 값이 변경될 우려가 있기에 안정성이 낮다.
// 정수가 아닌 문자열을 넣는다 해도 문자열이기에 오타 발생, 스위프트는 대소문자를 구별하기에 비교할때도 안정성 낮음.


/* 열거형 선언 방법
 enum TypeName {
 case caseName
 case caseName, caseName
 }
 */

// 열거형은 독립적이기에 구조체와 클래스과 같이 UpperCamelCase를 사용함.
// case의 이름은 lowerCamelCase를 사용하며, 여러개를 콤마를 사용하여 선언가능

// Tip: 중복된 단어는 제거하고 가장 단순한 이름으로 선언
enum Alignment {
    case left
    case right
    case center
}

Alignment.center

Alignment.right

// 자동완성을 사용하면 어떤 케이스가 있는지 바로 알 수 있음.

var textAlignment = Alignment.center

// 열거형은 독립적인 존재라고 생각하면 쉬움

// 열거형의 이름을 생략하고 케이스이름과 점만 적으면 됨
textAlignment = .left // 반드시 점을 써야 함

//textAlignment = .justify // error: 존재하지 않는 케이스

//textAlignment = .Left // error: 케이스 이름이 잘못 됨.

if textAlignment == .center {
    
}

// 스위치문을 사용한다면 가독성이 더 증가함.
switch textAlignment {
case .center:
    print("Center")
case .right:
    print("Right")
case .left:
    print("Left")
//default: // 열거형에 선언된 모든 케이스는 매칭되어있기에 default코드는 필요없음.
}
