
import UIKit

/*
 static func name(Parameters) -> ReturnType {
     statements
 }

 <서브클래스에서 오버라이딩을 허용할 때 사용>
 class func name(Parameters) -> ReturnType {
     statements
 }

 <호출 방법>
 Type.method(parameters)
 */

class Circle {
    static let pi = 3.14
    var radius = 0.0
    
    func getArea() -> Double {
        return radius * radius * Circle.pi
    }
    
    // 타입 메서드에서는 타입이름 없이 타입 속성에 바로 접근가능
    class func printPi() {
        print(pi)
    }
}

Circle.printPi()

class StrokCircle: Circle {
    override static func printPi() {
        print("<오버라이드된 'printPi' 형식 메서드>", pi)
    }
}

StrokCircle.printPi()
