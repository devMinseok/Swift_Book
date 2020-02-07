
import UIKit

// MARK: Overriding

class Figure {
    var name = "Unknown"
    
    init(name: String) {
        self.name = name
    }
    
    // final 키워드를 추가하여 오버라이딩을 금지시킬 수 있음.
    final func draw() {
        print("draw \(name)")
    }
}

class Circle: Figure {
    final var radius = 0.0
    
    var diameter: Double {
        return radius * 2
    }
    
    // override 키워드를 사용하여 상위멤버를 재정의함.
//    override func draw() {
//        super.draw() // super 키워드를 통하여 부모클래스의 멤버를 가져옴
//        print("😅")
//    }
}

// 생성자도 상속됨
let c = Circle(name: "Circle")
c.draw()

class Oval: Circle {
    // 읽기 전용 속성을 읽기와 쓰기가 가능한 속성으로 오버라이딩하는건 허용
    // 읽기와 쓰기가 가능한 속성을 읽기 전용으로 오버라이딩 하는 것은 안됨. (get, set 둘 다 구현해야함)
    
//    override var diameter: Double {
//        willSet {
//            print(newValue)
//        }
//        didSet {
//            print(oldValue)
//        }
//    }
    
//    override var radius: Double {
//        willSet {
//            print(newValue)
//        }
//        didSet {
//            print(oldValue)
//        }
//    }
}

let o = Oval(name: "Oval")
// 오버라이딩이 금지 됐다고 해서 상속 대상에서 제외된 것은 아님.
o.radius
o.draw()
