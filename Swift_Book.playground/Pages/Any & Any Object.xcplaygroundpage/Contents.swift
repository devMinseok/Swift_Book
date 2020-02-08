
import UIKit

// MARK: Any, AnyObject (범용 자료형)

// 범용 자료형은 코드의 유연성을 높여주는 장점
// 남용할 경우 코드의 가독성이 떨어지게 되고, 유지보수가 어려워지는 단점
// 사용하지 않는 것이 좋지만, 프레임워크에서 범용 자료형을 사용하는 경우가 있음

// Any: 모든 형식을 저장할 수 있음
// Any Object: 모든 클래스 형식을 저장할 수 있음

// 값, 참조 둘 다 저장 가능
var data: Any = 1
data = 2.3
data = "str"
data = [1, 2, 3]
data = NSString()

// 참조 형식만 저장가능
var obj: AnyObject = NSString()

// Any, Any Object는 형식이 저장되어 있지 않아 인스턴스를 사용하기 위해서는 타입캐스팅이 필요

if let str = data as? String {
    print(str.count)
} else if let list = data as? [Int] {
    print(list.count)
}

// MARK: Type Casting Pattern

// 타입 캐스팅 패턴은 주로 범용형식으로 저장되었거나 업캐스팅된 인스턴스를 매칭시킬때 주로 사용

switch data {
case let str as String:
    print(str.count)
case let list as [Int]:
    print(list.count)
case is Double:
    print("Double Value")
default:
    break
}
