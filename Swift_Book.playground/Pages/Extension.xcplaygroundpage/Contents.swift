
import UIKit

// MARK: Extension

// extension은 구조체, 클래스, 열거형, 프로토콜 타입에 새로운 기능을 추가할 수 있음

/* <extension이 타입에 추가할 수 있는 기능
 - 연산 타입 프로퍼티 / 연산 인스턴스 프로퍼티
 - 타입 메서드 / 인스턴스 메서드
 - 이니셜라이저
 - 서브스크립트
 - 중첩 타입
 - 특정 프로토콜을 준수할 수 있도록 기능 추가
 */

// extension이 타입에 새로운 기능을 추가할 수 있지만, 기존에 존재하는 기능을 재정의할 수는 없음

/*
 extension TypeName {
    타입에 추가될 새로운 기능 구현
 }

 extension TypeName: protocols {
     프로토콜 요구사항 구현
 }
 */

// extension을 통해 타입에 연산 프로퍼티를 추가할 수 있음
extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
    
    var isOdd: Bool {
        return self % 2 == 1
    }
}

// extension을 통해 타입에 메서드를 추가할 수 있음

extension Int {
    func multiply(by n: Int) -> Int {
        return self * n
    }
    
    mutating func multiplySelf(by n: Int) {
        self = self.multiply(by: n)
    }
    
    static func isIntTypeInstance(_ instance: Any) -> Bool {
        return instance is Int
    }
}

// 관련 기능별로 하나의 extension 블록에 묶어주는 것이 좋음

// 타입의 정의 부분에 생성자를 추가하지 않더라도 extension을 통해 생성자를 추가할 수 있음
// extension으로 클래스 타입에 convenience 생성자는 추가할 수 있지만, 지정 생성자는 추가할 수 없음
// 지정 생성자와 소멸자는 반드시 클래스 타입의 구현부애 위치해야함 (구조체는 상관없음)

extension String {
    init(intTypeNumber: Int) {
        self = "\(intTypeNumber)"
    }
    
    init(doubleTypeNumber: Double) {
        self = "\(doubleTypeNumber)"
    }
}

class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

extension Person {
    convenience init() {
        self.init(name: "Unknown")
    }
}

// extension을 통해 타입에 서브스크립트를 추가할 수 있음

extension String {
    subscript(appedValue: String) -> String {
        return self + appedValue
    }
    
    subscript(repeatCount: UInt) -> String {
        var str: String = ""
        
        for _ in 0..<repeatCount {
            str += self
        }
        
        return str
    }
}

// extension을 통해 타입에 중첩된 데이터 타입을 추가할 수 있음

extension Int {
    enum Kind {
        case negative, zero, positive
    }
    
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}


