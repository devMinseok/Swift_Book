
import UIKit
import Foundation

// MARK: Protocol

// 프로토콜은 특정 역할을 하기 위한 메서드, 프로퍼티, 기타 요구사항 등의 청사진(설계도)을 정의함.
// 구조체, 클래스, 열거형은 프로토콜을 채택하여 특정 기능을 실행하기 위한 프로토콜의 요구사항을 실제로 구현할 수 있음.
// 타입(구조체, 클래스, 열거형)에서 프로토콜의 요구사항을 충족시키려면 프로토콜이 제시하는 청사진의 기능을 모두 구현해야함.
// 프로토콜의 이름은 UpperCamelCase

/* <프로토콜 선언방법>
 protocol ProtocolName {
    프로토콜 정의
 }
 */

/* <프로토콜 채택방법>
 struct StructName: Protocol1, Protocol2 {
    // 구조체 정의
 }

 class ClassName: Protocol1, Protocol2 {
    // 클래스 정의
 }
 
 enum EnumName: Protocol1, Protocol2 {
    // 열거형 정의
 }
 */

/* <클래스가 상속을 받는경우>
 class ClassName: SuperClass, Protocol1, Protocol2 {
    // 클래스 정의
 }
 
- 상속받을 클래스 이름 다음에 채택할 프로토콜을 나열
 */

// 프로토콜이 자신을 채택한 타입에 요구하는 사항은 프로퍼티나 메서드와 같은 기능들임.

// MARK: 프로퍼티 요구

/*
 프로토콜은 프로퍼티의 종류(연산 프로퍼티, 저장 프로퍼티인지)는 따로 신경 쓰지 않음.
 프로퍼티를 읽기 전용으로 할지, 읽고 쓰기가 모두 가능하게 할지는 프로토콜이 정해야함.

 프로토콜의 프로퍼티 요구사항은 항상 var 키워드를 사용한 변수 프로퍼티로 정의함.
 읽고 쓰기가 모두 가능한 프로퍼티는 프로퍼티 정의 뒤에 '{ get set }'으로 명시
 읽기 전용 프로퍼티는 프로퍼티의 정의 뒤에 '{ get }'으로 명시

 타입 프로퍼티를 요구하려면 'static'키워드를 사용
 클래스의 타입 프로퍼티는 상속 가능한 프로퍼티인 class 타입 프로퍼티와 상속 불가능한 static 타입 프로퍼티가 있지만 프로토콜에서는 구분하지 않고 모두 'static'키워드를 사용하여 타입 프로퍼티를 요구하면 됨
 */

protocol SomeProtocol1 {
    var settableProperty: String { get set }
    var notNeesToBeSettableProperty: String { get }
}

protocol SomeProtocol2 {
    static var someTypeProperty: String { get set }
    static var anotherTypeProperty: String { get }
}

// MARK: 메서드 요구

// 프로토콜은 특정 인스턴스 메서드나 타입 메서드를 요구할 수도 있음
// 프로토콜이 요구할 메서드는 프로토콜 정의에서 작성

/*
 메서드의 실제 구현부인 중괄호 부분은 제외하고 메서드의 이름, 매개변수, 반환 타입 등만 작성하며 가변 매개변수도 허용함]
 타입 메서드를 요구할 때는 static키워드를 명시
 */

protocol SomeProtocol3 {
    func example(num: Int)
    static func typeExample(str: String)
}

// MARK: 가변 메서드 요구

// 값 타입(구조체, 열거형)의 인스턴스 메서드에서 자신 내부의 값을 변경하고자 할 때는 'mutating'키워드를 명시함

protocol SomeProtocol4 {
    mutating func example()
}

// MARK: 생성자 요구

// 메서드 요구와 마찬가지로 생성자를 정의하지만 구현 하지는 않음

protocol SomeProtocol5 {
    var property: String { get }
    
    init(property: String)
}

// 실패 가능한 생성자를 요구할 수도 있음
// 프로토콜을 준수하는 타입은 해당 생성자를 구현할 때 실패 가능한 생성자로 구현해도, 일반적인 생성자로 구현해도 무방함

protocol SomeProtocol6 {
    var property: String { get }
    
    init?(property: String)
}

// MARK: 프로토콜의 상속 & 클래스 전용 프로토콜

// 프로토콜은 하나 이상의 프로토콜을 상속받아 기존 프로토콜의 요구사항보다 더 많은 요구사랑을 추가할 수 있음

protocol Readbale {
    func read()
}

protocol Writeable {
    func write()
}

protocol ReadSpeakable: Readbale {
    func speak()
}

protocol ReadWriteSpeakable: Readbale, Writeable {
    func speak()
}

// 프로토콜의 상속 리스트에 'class'키워드를 추가하여 프로토콜이 클래스 타입에만 채택될 수 있도록 제한할 수 있음
// 클래스 전용 프로토콜로 제한을 주기 위해서는 프로토콜의 상속 리스트에서 맨 처음에 'class'키워드가 위치해야함

protocol ClassOnlyProtocol: class, Readbale, Writeable {
    // 추가 요구사항
}

// MARK: 프로토콜 조합과 프로토콜 준수 확인

// 하나의 매개변수가 여러개의 프로토콜을 준수해야 한다면 하나의 매개변수에 여러 프로토콜을 한 번에 조합하여 요구 가능
// 프로토콜을 조합하여 요구할 때는 &를 사용합니다.
// 구조체나 열거형 타입은 조합X, 조합 중 클래스 타입은 한 타입만 조합할 수 있음

/*
 func example(num: Protocol1 & Protocol2) {

 }

  var example: Class & Protocol

 */

// 타입캐스팅에서 사용하던 is와 as연산자를 사용하여 대상이 프로토콜을 준수하는지 확인할 수 있음
// 특정 프로토콜로 캐스팅할 수 있음

/*
 - is 연산자를 통해 해당 인스턴스가 특정 프로토콜을 준수하는지 확인할 수 있음
 - as? 다운캐스팅 연산자를 통해 다른 프로토콜로 다운캐스팅을 시도해볼 수 있음
 - as! 다운캐스팅 연산자를 통해 다른 프로토콜로 강제 다운캐스팅을 할 수 있음
 */

// MARK: 프로토콜의 선택적 요구

/*
 프로토콜의 요구사랑 중 일부를 선택적 요구사항으로 지정할 수 있음
 선택적 요구사항을 정의하고 싶은 프로토콜은 objc 속성이 부여된 프로토콜이어야 함
 열거형이나 구조체 등에서는 objc 속성이 부여된 프로토콜은 채택 불가능

 선택적 요구사항은 optional 식별자를 요구사항의 정의 앞에 붙이면 됨
 프로퍼티를 선택적 요구사항으로 요구하게 되면 그 요구사항의 타입은 자동적으로 옵서널이 됨
 메서드의 매개변수나 반환 타입이 옵셔널이 된 것이 아닌 메서드(함수) 자체의 타입이 옵셔널이 된 것
 
 선택적 요구사항은 그 프로토콜을 준수하는 타입에 구현되어 있지 않을 수 있기 때문에 옵셔널 체이닝을 통해 호쿨할 수 있음
 */

@objc protocol Moveable {
    func walk()
    @objc optional func fly()
}

// MARK: 프로토콜 변수와 상수

// 프로토콜 이름을 타입으로 갖는 변수 또는 상수에는 그 프로토콜을 준수하는 타입의 어떤 인스턴스라도 할당할 수 있음
