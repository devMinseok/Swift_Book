
import UIKit

// 메서드는 특정 형식에 속한 형식

/*
 func name(parameters) -> ReturnType {
 Code
 }
 
 <메서드 호출 방법>
 instance.method(parameters)
 */

// 함수와의 차이점: 구현하는 위치가 다르고, 인스턴스를 통해 호출함 (함수와 문법은 완전히 동일)
// 함수는 특정 형식에 연관되지 않은 동작을 구현하지만, 메서드는 특정 형식에 연관된 동작을 구현함

// 인스턴스는 클래스, 구조체, 열거형에서 구현 가능

// 함수는 함수이름을 통해 호출하지만, 메서드는 인스턴스이름을 사용하여 호출함.

class Sample {
    var data = 0
    static var sharedData = 123
    
    func doSomething() {
        print(data)
        // 인스턴스멤버에서 타입멤버에 접근하는 방법
        Sample.sharedData // 형식이름을 사용하여 접근
    }
    
    func call() {
        doSomething() // == self.doSomething
    }
}

let a = Sample()
a.data
a.doSomething()
a.call()

struct Size {
    var width = 0.0
    var height = 0.0
    
    // 구조체에서 속성을 바꾸는 메서드를 구현할 땐 반드시 mutating으로 선언해야함.
    mutating func enlarge() {
        width += 1.0
        height += 1.0
    }
}

// 구조체에서 인스턴스의 가변성은 멤버의 가변성에 영향을 끼치기에 변수형 인스턴스로 생성
var s = Size()
s.enlarge()

