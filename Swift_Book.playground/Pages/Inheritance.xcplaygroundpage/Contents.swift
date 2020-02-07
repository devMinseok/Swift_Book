
import UIKit

// MARK: Inheritance

/*
 class ClassName: SuperClassName {
     
 }
 */

// 다중 상속은 안되기에 SuperClass를 연달아 적는것은 불가능

class Figure {
    var name = "Unknown"
    
    init(name: String) {
        self.name = name
    }
    
    func draw() {
        print("draw \(name)")
    }
}

class Circle: Figure {
    var radius = 0.0
}

// 생성자도 상속됨
let c = Circle(name: "Circle")
c.radius
c.name
c.draw()

// SubClass는 SuperClass로부터 멤버를 상속 받음


// MARK: final class

/*
 final class ClassName: SuperClassName {
     
 }
 */

// final 클래스는 상속이 금지된 클래스
// final 클래스가 다른 클래스를 상속하는 것은 가능하지만, 다른 클래스가 final 클래스를 상속하는 것은 불가능
final class Rectangle: Figure {
    var width = 0.0
    var height = 0.0
}

/* Rectangle 클래스는 final 클래스이기 때문에 상속이 불가능함 (error)
 class Square: Rectangle {
     
 }
 */
