
import UIKit

/* 생성자
 init(parameters) {
     statements
 }
 */

let str = "123"
let num = Int(str)

class Position {
    var x: Double
    var y: Double
    
    // 생성자 실행이 종료되는 시점에는 모든 속성의 초기값이 저장되어 있어야함
    init() {
        x = 0.0
        y = 0.0
    }
    
    init(value: Double) {
        x = value
        y = value
    }
}

let a = Position()

a.x
a.y

let b = Position(value: 100)

b.x
b.y

