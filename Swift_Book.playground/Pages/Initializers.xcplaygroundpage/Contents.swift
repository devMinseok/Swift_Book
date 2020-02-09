
import UIKit

// MARK: Initialization
// <Default Initializer> - 기본 생성자

class position {
    var x = 0.0
    var y = 0.0
    var z: Double? = nil

}

// 모든 속성이 기본값을 가지고 있고, 생성자를 직접 구현하지 않는다면 기본 생성자가 자동으로 제공됨.
// 생성자를 직접 구현한다면 기본 생성자는 제공되지 않음
let p = position()

// MARK: Initializer Syntax

/*
 init(<#parameters#>) {
     <#statements#>
 }
 
 TypeName(parameters)
 */

class SizeObj {
    var width = 0.0
    var height = 0.0
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    convenience init(value: Double) {
//        width = value
//        height = value
        self.init(width: value, height: value)
    }
}


// MARK: Memberwise Initializer
// 구조체만 해당

struct SizeValue {
    var width = 0.0
    var height = 0.0
}

let s = SizeValue() // 기본 생성자
SizeValue(width: 1.2, height: 3.4) // Memberwise 생성자

// 파라미터를 통해 속성을 모두 초기화하기 때문에 'Memberwise Initializer' 라고함

