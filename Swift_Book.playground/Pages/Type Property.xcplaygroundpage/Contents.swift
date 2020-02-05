
import UIKit

// MARK: Stored Type Properties

/*
 static var name: Type = DefaultValue
 static let name: Type = DefaultValue
 
 TypeName.propertyName // 접근 방법
 */

// 저장 형식 속성은 속성에 최초로 접근할 떄 초기화됨.
// 형식속성은 특정 인스턴스에 속한 속성이 아니기 때문에 인스턴스 이름으로는 접근할 수 없슴.

class Math {
    static let pi = 3.14
}

let m = Math()

//m.pi // error: 형식 속성은 인스턴스 이름으로는 접근X
Math.pi

// 형식속성은 기본적으로 지연속성(lazy)임.
// 속성에 처음 접근할 떄 초기화

// MARK: Computed Type Properties

/*
 <서브클레스에서 오버라이딩 금지>
 static var name: Type {
     get {
         statements
         return expr
     }
     set(name) {
         statements
     }
 }

 <서브클래스에서 오버라이딩 허용>
 class var name: Type {
     get {
         statements
         return expr
     }
     set(name) {
         statements
     }
 }
 */

enum Weekday: Int {
    case sunday = 1, monday, tuesday, wednesday, thursday, friday, saturday
    
    static var today: Weekday {
        let cal = Calendar.current
        let today = Date()
        let weekday = cal.component(.weekday, from: today)
        return Weekday(rawValue: weekday)!
    }
}

Weekday.today
