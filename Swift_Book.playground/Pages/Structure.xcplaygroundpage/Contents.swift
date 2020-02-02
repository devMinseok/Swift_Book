
import UIKit

/*
  구조체 선언 방법
 struct StructName {
     property
     method
     initializer
     subscript
 }
 */

// 구조체 이름은 UpperCamelCase

// 구조체 내에 구현하는 요소를 멤버라고 함
// 멤버의 이름은 lowerCamelCase

struct Person {
    var name: String
    var age: Int
    
    func speak() {
        print("Hello")
    }
}

// 인스턴스 생성
let p = Person(name:"Steve", age: 50)

let name = "Paul"
name

p.name
p.age

p.speak()

// 함수와 메서드 차이점: 함수는 이름만 호출하고, 메서드는 인스턴스 이름을 통해 호출함
