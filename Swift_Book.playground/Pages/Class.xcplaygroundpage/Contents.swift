
import UIKit

/*
 class ClassName {
     property
     method
     initializer
     deinitializer
     subscript
 }
 */

// 클래스 이름은 UpperCamelCase
// 맴버 이름은 lowerCamelCase

class Person {
    var name = "John Cina"
    var age = 0
    
    func speak() {
        print("What?")
    }
}
 
let p = Person()

print("My name is.. \(p.name) and I'm \(p.age) years old")
p.speak()
