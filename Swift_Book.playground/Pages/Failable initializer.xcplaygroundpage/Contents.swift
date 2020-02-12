
import UIKit

// MARK: Failable initializer (실패 가능한 생성자)

// 생성자를 통해 인스턴스를 초기화하지 못하는 상황이 있는데, 이런 실패 가능성을 염두한, 실패 가능성을 내포한 생성자.
// 실패 가능한 생성자는 클래스, 구조체, 열거형 등에 모두 정의가능
// 실패 하였을떼 nil을 반환해줌.
// nil을 반환하기에 'init'키워드 대신 'init?'키워드를 사용함

/*
 init?(parameters) {
     if condition {
         return nil
     }
     statements
 }
 */

class Person {
    let name: String
    var age: Int?
    
    init?(name: String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
    
    init?(name: String, age: Int) {
        if name.isEmpty || age < 0 {
            return nil
        }
        self.name = name
        self.age = age
    }
}
