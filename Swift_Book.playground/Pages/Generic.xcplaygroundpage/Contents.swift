
import UIKit

// MARK: Generic

// Array, Dictionay, Set 등의 타입은 모두 제네릭 컬렉션임.

/*
 제네릭을 사용하고자 하는 타입 이름 <타입 매개변수>
 제네릭을 사용하고자 하는 함수 이름 <타입 매개변수> (함수의 매개변수)
 */

// MARK: 제네릭 함수

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA: T = a
    a = b
    b = temporaryA
}

// 제네릭 함수는 실제 타입 이름(Int, String 등)을 써주는 대신에 플레이스홀더(T, Element)를 사용함.
// 플레이스홀더는 실제 타입의 종류를 알려주지 않지만, 어떤 타입이라는 것은 알려줌.
// T의 실제 타입은 함수가 호출되는 순간에 결정됨.
// T가 플레이스홀더로 사용되기 때문에 스위프트 컴파일러는 함수의 문법을 검사할 때, T의 실제 타입을 신경쓰지않음.
// 여러 개의 타입 매개변수 지정 가능 //'<T, U, V>'

// MARK: 제네릭 타입

// 제네릭 타입은 구조체 이름 옆에 플레이스홀더를 넣어 훨씬 유연하고 광범위하게 사용 할 수 있게함

struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var doubleStack: Stack<Double> = Stack<Double>()

doubleStack.push(1.0)
print(doubleStack.items)
doubleStack.push(2.0)
print(doubleStack.items)
doubleStack.pop()
print(doubleStack.items)

/*
 Stack 구조체는 Int라는 타입 대신 Element라는 타입 매개변수를 사용
 Element라는 매개변수는 items 배열의 요소 타입으로 지정, push(_:)와 pop(_:) 메서드의 매개변수와 반환타입으로도 지정
 */

// MARK: 제네릭 타입 확장

// 만약 익스텐션을 통해 제네릭을 사용하는 타입에 기능을 추가하고자 한다면 익스텐션 정의에 타입 매개변수를 명시하지 않아야 함.
// 원래의 제네릭 정의에 명시한 타입 매개변수(Element)를 익스텐션에서 사용할 수 있음.

extension Stack {
    var topElement: Element? {
        return self.items.last
    }
}
// 익스텐션 정의에는 타입 매개변수를 정의하지 않았지만 기존의 제네릭 타입에 정의되어 있는 Element라는 타입을 사용

print(doubleStack.topElement)

// MARK: 타입 제약

// 타입 제약 클래스 타입 또는 프로토콜로만 줄 수 있음. (열거형, 구조체 등의 타입은 타입 제약의 타입으로 사용불가)
// 제네릭 타입에 제약을 주고 싶다면 타입 매개변수 뒤에  콜론을 붙인 후 원하는 클래스 타입 또는 프로토콜을 명시

/*
 func swapTwoValues<T: BinaryInteger>(_ a: inout T, _ b: inout T) {
     // 함수 구현
 }

 struct Stack<Element: Hashable> {
     // 구조체 구현
 }

 <여러 제약을 추가하고 싶다면 where 절을 사용>
 func swapTwoValues<T: BinaryInteger>(_ a: inout T, _ b: inout T) where T: FloatingPoint {
     // 함수 구현
 }
 */



