
import UIKit

// MARK: RawValuse: 열거형의 case는 독립적이지만 내부에 또다른 값을 저장할 수 있음.

// 열겨형에서 원시값은 필수가 아님 (선택사항)
// 직접 만든 열거형에는 별로 사용하지 않지만, 프레임워크에는 많이 사용됨

/*
 enum TypeName: RawValuesType {
     case caseName = Values
 }
 */

enum Alignment: Int {
    case left
    case center = 100
    case right
}

// 원시값을 직접 지정하지 않으면 자료형의 규칙에 따라 기본값이 넣어짐
// 기준이 되는 값은 바로 이전의 값
Alignment.left.rawValue // 0
Alignment.center.rawValue // 100
Alignment.right.rawValue // 101

//Alignment.left.rawValue = 10 // error: 열거형 선언 이후에 원시값은 변경할 수 없다

Alignment(rawValue: 0)

Alignment(rawValue: 200) // 존재하지 않는 원시값은 nil을 반환함


// 열거형은 한정된 값을 처리할때 사용
enum Weekday: String {
    case sunday
    case monday = "MON"
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
}
 
// 원시값 자료형을 문자열로 하고, 원시값을 직접 지정하지 않으면, case의 이름이 원시값이 됨
Weekday.sunday.rawValue
Weekday.monday.rawValue

// 원시값 자료형을 Character로 했다면, 반드시 원시값을 직접 지정해주어야함
// 숫자처럼 값을 증가 시키거나, 문자열처럼 case의 이름을 원시값으로 사용할 수 없기 때문에
enum ControlChar: Character {
    case tab = "\t"
    case newLine = "\n"
}

// MARK: Associated Values (연관값)

/*
 enum TypeName {
     case caseName(Type)
     case caseName(Type, Type, ...)
 }
 */

/*
    연관값은 저장할 값의 형식을 개별 케이스마다 따로 선언함
    연관값은 튜플로 선언함
    연관값은 케이스이름 뒤에서 선엄함
    연관값은 자료형 제안이 없음 (하나의 케이스에 서로다른 연관값을 저장할 수 있음)
    연관값은 새로운 열거형을 생성할 때 저장함
 */

// 연관값은 케이스에 값을 저장한다는 것 외에는 원시값과의 공통점이 없음
// 하나의 열거형에서 두가지 다 사용 불가능

enum VideoInterface {
    case dvi(width: Int, height: Int)
    case hdmi(Int, Int, Double, Bool)
    case displayPort(CGSize)
}

var input = VideoInterface.dvi(width: 2048, height: 1536)

// 연관값의 확인한 다음에 코드를 실행 할 때는 스위치문을 사용
switch input {
case .dvi(2048, 1536):
    print("dvi 2048 x 1536")
case .dvi(2048, _):
    print("dvi 2048 x Any")
case .dvi:
    print("dvi")
case .hdmi(let width, let height, let version, var audioEnabled):
    print("hdmi \(width)x\(height)")
case let .displayPort(size):
    print("dp")
}

input = .hdmi(3840, 2160, 2.1, true)
input


// MARK: Enumeration Case Pattern

/*
case Enum.case(let name):
case Enum.case(var name):

case let Enum.case(name):
case var Enum.case(name):
 */

enum Transportation {
    case bus(number: Int)
    case taxi(company: String, number: String)
    case subway(lineNumber: Int, express: Bool)
}

var tpt = Transportation.bus(number: 7)

switch tpt {
case .bus(let n):
    print(n)
case .taxi(let c, var n):
    print(c, n)
case let .subway(l, e): // 여러 값을 바인딩할 때는 더 효율적
    print(l, e)
}

tpt = Transportation.subway(lineNumber: 2, express: false)

if case let .subway(2, express) = tpt {
    if express {
        print("express")
    } else {
        print("X")
    }
}

if case .subway(_, true) = tpt {
    print("express")
}

let list = [
    Transportation.subway(lineNumber: 2, express: false),
    Transportation.bus(number: 4412),
    Transportation.subway(lineNumber: 7, express: true),
    Transportation.taxi(company: "SeoulTaxi", number: "1234")
]

for case let .subway(n, _) in list {
    print("subway: \(n)")
}

for case let .subway(n, true) in list {
    print("subway: \(n)")
}

for case let .subway(n, true) in list where n == 2 {
    print("subway: \(n)")
}
