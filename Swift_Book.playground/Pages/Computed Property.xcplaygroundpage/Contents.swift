
import UIKit

// MARK: Computed Properties
/*
 var name: Type {
     get {
         statements
         return expr
     }
     set(name) {
         statements
     }
 }
 */

class Person {
    var name: String
    var yearOfBirth: Int
    
    init(name: String, year: Int) {
        self.name = name
        self.yearOfBirth = year
    }
    
    // var age: Int = {... <= 이건 클로저 저장임
    var age: Int {
         
            let calendar = Calendar.current
            let now = Date()
            let year = calendar.component(.year, from: now)
            return year - yearOfBirth // 현재년도 - 현재나이 (출생년도)
        
//        set {
//            let calendar = Calendar.current
//            let now = Date()
//            let year = calendar.component(.year, from: now)
//            yearOfBirth = year - newValue
//        }
    }
}

let p = Person(name: "John Cina", year: 2002)

p.age

//p.age = 50
p.yearOfBirth

// MARK: Read-only Computed Properties

/*
 var name: Type {
     get {
         statements
         return expr
     }
 }

 <get 키워드 생략>
 var name: Type {
     statements
     return expr
 }
 */

// 쓰기 전용 계산 속성은 없음. (set만 쓰는건 불가능)
