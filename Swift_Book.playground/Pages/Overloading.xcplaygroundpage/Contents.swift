
import UIKit

// MARK: Overloading

// 오버로딩: 하나의 형식에서 동일한 이름을 가진 다수의 멤버를 구현할 때 사용

func process(value: Int) {
    print("process Int")
}

func process(value: String) {
    print("process String")
}

func process(value: String, anotherValue: String) {
    
}

func process(_ value: String) {
    
}

process(value: 0)
process(value: "str")

process(value: "str")
process("str")

func process(value: Double) -> Int {
    return Int(value)
}

func process(value: Double) -> String? {
    return String(value)
}

let result1: Int = process(value: 12.34)
//let result1 = process(value: 12.34) as Int // 형식 추론을 사용하고 싶다면 타입캐스팅을 사용하면 됨.

let result2: String? = process(value: 34.56)
//let result2 = process(value: 12.34) as String?

// 오버로딩 지원대상: 함수, 메서드, 서브스크립트, 생성자

/*
 오버로딩 규칙:
 1. 함수 이름이 동일하면 파라미터 수로 식별
 2. 함수 이름, 파라미터 수가 동일하면 파라미터 자료형으로 식별
 3. 함수 이름, 파라미터가 동일하다면 Argument Label로 식별
 4. 함수 이름, 파라미터, Argument Label이 동일하면 반환형으로 식별 // 가급적 사용 자제 (차라리 함수 명을 바꾸는게 좋음)
 */

struct Rectangle {
    func area() -> Double {
        return 0.0
    }
    
    static func area() -> Double {
        return 0.0
    }
}

let r = Rectangle()
r.area // 인스턴스명을 사용하여 호출

Rectangle.area // 형식 자체를 사용하여 호출

// 타입 메서드와 일반 메서드의 호출 방식이 다르기에 상관없음
