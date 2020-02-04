
import UIKit

/*
 Value Types: Structure, Enumeration, Tuple
 Reference Types: Class, Closure
 */

// 함수는 값을 전달
struct PositionValue {
    var x = 0.0
    var y = 0.0
}

// 클래스는 참조(원본)을 전달
class PositionObject {
    var x = 0.0
    var y = 0.0
}
 
var v = PositionValue()

var o = PositionObject()

var v2 = v
var o2 = o

v2.x = 12
v2.y = 34

// 값이 복사 됐기에 기존값은 변하지 않음
v.x
v.y

o2.x = 56
o2.y = 78

// 값을 참조하였기 때문에 기존값도 같이 변함
o.x
o.y
