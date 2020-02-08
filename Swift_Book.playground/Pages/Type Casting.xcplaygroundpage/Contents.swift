
import UIKit

// MARK: Type Casting

class Figure {
   let name: String
   
   init(name: String) {
      self.name = name
   }
   
   func draw() {
      print("draw \(name)")
   }
}

class Triangle: Figure {
   override func draw() {
      super.draw()
      print("🔺")
   }
}

class Rectangle: Figure {
   var width = 0.0
   var height = 0.0
   
   override func draw() {
      super.draw()
      print("⬛️ \(width) x \(height)")
   }
}

class Square: Rectangle {
   
}

class Circle: Figure {
   var radius = 0.0
   
   override func draw() {
      super.draw()
      print("🔴")
   }
}

// MARK: Type Check Operator

/* (is 연산자)
 expression is Type
 */

// expression에는 주로 형식을 확인할 대상, 오른쪽에는 언제나 형식이 옴

// 두 피연산자의 형식이 동일하다면 true를 반환함.
// 왼쪽 피연산자의 형식이 오른쪽 피연사자의 형식과 동일한 상속계층에 있고, 오른쪽 피연산자가 super클래스라면 true를 반환

let num = 123

num is Int
num is Double
num is String

let t = Triangle(name: "Triangle")
let r = Rectangle(name: "Rect")
let s = Square(name: "Square")
let c = Circle(name: "Circle")

r is Rectangle
r is Figure
r is Square

// MARK: Type Casting Operator

/* (as 연산자)
 <Compile Time Cast>
 expression as Type
 
 <Runtime Cast>
 expression as? Type // Conditional Cast
 expression as! Type // Forced Cast
 */

// 서로 호환되는 형식을 캐스팅 하는것을 'Bridging'이라고 한다.

// <Compile Time Cast>

// compile time에 결과가 확정됨
let nsstr = "str" as String

//"str" as Int // error 캐스팅에 실패 시 컴파일 타임때 에러가 남

// <Runtime Cast>

// 캐스팅에 옵셔널 개념이 추가됨
// 런타임에 실행됨 (컴파일 타임엔 결과를 알 수 없음)
// 캐스팅에 성공하면 캐스팅된 인스턴스를 반환하고, 실패하면 nil을 반환함.

// Forced Cast는 캐스팅에 실패 시  clash가 발생함 (가급적 사용X)

t as? Triangle
t as! Triangle

var upcasted: Figure = s
upcasted = s as Figure

upcasted as? Square
upcasted as! Square

upcasted as? Rectangle
upcasted as! Rectangle

upcasted as? Circle
//upcasted as! Circle // Clash:

// 실제로 다운캐스팅을 구현 할 때는 컨디셔널 캐스트와 옵셔널 바인딩을 같이 사용하는 것이 좋음
if let c = upcasted as? Circle {
    
}

// 모든 요소가 동일한 상속 계층에 있다면, 가장 인접한 super클래스로 업캐스팅되어 저장됨.
let list = [t, r, s, c]

for item in list {
    item.draw()
    if let c = item as? Circle {
        c.radius
    }
}

// 업캐스팅된 인스턴스를 통해서 메서드를 호출하더라도 실제 형식에서 오버라이딩한 메서드가 호출된다.
