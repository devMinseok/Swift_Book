
import UIKit

// MARK: Required Initializer

/*
 Required init(parameters) {
     initialization
 }
 */

// super클래스를 상속하는 클래스는 super클래스에 required생성자가 있다면 무조건 구현해야함
// sub클래스에서 모든 속성이 기본값을 가지고 있고, 생성자를 직접 구현하지 않았다면 super클래스의 required생성자를 상속 받기에 구현 할 필요 X
class Figure {
   var name: String

    required init(name: String) {
      self.name = name
   }

   func draw() {
      print("draw \(name)")
   }
}

class Rectangle: Figure {
   var width = 0.0
   var height = 0.0
    
    init() {
        width = 0.0
        height = 0.0
        super.init(name: "unknown")
    }
    
    required init(name: String) {
        width = 0.0
        height = 0.0
        super.init(name: name)
    }
}

// super클래스를 상속하는 다른 sub클래스들이 다시 동일한 생성자를 구현 하도록 강제 하기위해 사용함
