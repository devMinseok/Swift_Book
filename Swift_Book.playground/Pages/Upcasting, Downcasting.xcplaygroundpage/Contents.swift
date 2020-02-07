
import UIKit

class Figure {
    var name = "Unknown"
    
    init(name: String) {
        self.name = name
    }
    
    func draw() {
        print("draw \(name)")
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

let f = Figure(name: "Unknown")
f.name

let r = Rectangle(name: "Rect")
r.width
r.height
r.name

// MARK: Upcasting

let s: Figure = Square(name: "Square")
//s.width
//s.height
//s.name

// MARK: Downcasting

let downcastedS = s as! Rectangle
downcastedS.name
downcastedS.width
downcastedS.height

class Rhombus: Square {
    var angle = 45.0
}

//let dr = s as! Rhombus // error: 인스턴스의 원래형식인 Square보다 아랫쪽에 있음
