
import UIKit

// 배열은 single type
// 0 Based index
// 배열은 제네릭 형식
// 빈 배열

// MARK: 배열 생성(Create Array)

// -<정식 문법>-
// Tip: 정식 문법보다는 단축 문법을 주로 사용.

// (let 또는 var) 배열 이름: Array<배열의 타입>
let arr1: Array<Int>


// -<단축 문법>-
// Tip: 'Array<배열의 타입>' >>> '[배열의 타입]'

// (let 또는 var) 배열 이름: [배열의 타입]
let arr2: [Int]


// -<형식 추론>-
// 배열의 타입을 명시하지 않아도 되지만, 빈 배열을 만들 경우에는 타입을 반드시 명시해야함.

// (let 또는 var) 배열 이름 = [배열의 타입과 일치하는 타입의 값]
let arr5 = [1, 2, 3, 4, 5, 6]


// MARK: 배열에 값 넣기 (Put Values In Array)

// -<빈 배열 만들기>-
// 반드시 배열의 타입을 명시해야함.
//let emptyArray = [] // error: 타입 명시가 되있지 않음.

let emptyArray: [Int] = []

// 정식 문법 사용
let emptyArray2 = Array<Int>()

// 단축 문법 사용
let emptyArray3 = [Int]()


// -<임의의 값 넣기>-
// '='뒤에는 대괄호 사이에 배열의 타입과 일치하는 값을 넣어줘야 함.

// 정식 문법
let strArray1: Array<String> = ["정식", "문법"]

// 단축 문법
let strArray2: [String] = ["단축", "문법"]

// 형식 추론
let strArray3 = ["형식", "추론"]

// 시퀀스
let nums = Array(1...3) // == let nums = Array<Int>(1...3)

// 여러 자료형
let anyArr: [Any] = [1, 2, "three", "four"] // == let anyArr: Array<Any> = [1, 2, "three", "four"]

// -<크기가 정해진 배열>-
// Array(reapeating:count:)메소드 사용

let zeroArray1 = [Int](repeating: 0, count: 10)

let zeroArray2 = Array(repeating: 0, count: 10)

let strArray = [String](repeating: "str", count: 5)
let charArray = [Character](repeating: "c", count: 5)


// MARK: 배열 검사 (inspecting an Array)

// 배열에 들어있는 값의 개수 검사
nums.count
nums.count == 0

// 배열에 값이 있는지, 없는지를 확인 할땐 isEmpty속성 사용 추천.
nums.isEmpty
emptyArray.isEmpty

// MARK: 배열 요소 접근 (Accessing Elements)
// 스위프트 배열의 인덱스는 0부터 시작 (0, 1, 2, ...)

let fruits = ["Apple", "Banana", "Melon"] // "Apple"의 인덱스는 0

// -<서브스크립트>-
fruits[0]
fruits[1]
fruits[2]
//fruits[3] // error: 인덱스는 0부터 시작하기에 3은 없음 (인덱스를 벗어남)

// 범위 연산자를 사용하여 특정 범위를 추출
fruits[0...1]

// 첫 번째 요소 접근
fruits[fruits.startIndex]

// 마지막 요소 접근
//fruits[fruits.endIndex] : X
fruits[fruits.index(before: fruits.endIndex)] // : O

// -<속성 사용>-
// 처음과 마지막 접근
fruits.first
fruits.last

// 배열이 비어있다면 nil을 반환
emptyArray.first
emptyArray.last

//emptyArray[0] // index out of range

// 인덱스를 통한 접근과 속성을 통한 접근의 장단점:
// 인덱스 번호를 사용하여 접근한다면 빠르고 보기 쉽지만, 에러가 날 확률이 많다.
// 속성을 사용하여 요소에 접근한다면 안정적이다.



//--------------------------------------------------------------------<



//MARK: 배열 편집

// MARK: 배열 요소 추가 (Adding Elements)

var alphabet = ["A", "B", "C"]

// append() == 하나의 요소를 추가할 때 사용
alphabet.append("E")
//alphabet.append(1) : X 배열은 single type

// 두가지 이상의 요소를 추가하고 싶다면 append(contentsOf:)메소드 사용
alphabet.append(contentsOf: ["F", "G"])

// 원하는 위치에 요소를 추가하고 싶다면 insert(at:)메소드 사용
alphabet.insert("D", at: 3)

// 원하는 위치에 여러 요소를 추가하고 싶다면 insert(contentsOf:at:)메소드 사용
alphabet.insert(contentsOf: ["a", "b", "c"], at: 0)

//insert메소드 사용시 오버헤드가 발생하기에 반드시 필요한 경우에만 사용 권장

// MARK: 요소 교체 (Change Elements)
alphabet[0...2] = ["x", "y", "z"]
print(alphabet)

alphabet.replaceSubrange(0...2, with: ["a", "b", "c"])
print(alphabet)

// 여러 요소를 하나의 요소로도 교체가능
alphabet[0...2] = ["z"]
print(alphabet)

// 삭제또한 가능
alphabet[0..<1] = []
print(alphabet)

// MARK: Removing Elements (요소 삭제)
alphabet.remove(at: 2)
print(alphabet)

//alphabet.remove(at: 100) // 잘못된 인덱스 전달시 에러

alphabet.removeFirst()
print(alphabet)

// 배열 앞 부분에 있는 요소를 갯수만큼 삭제
alphabet.removeFirst(2)
print(alphabet)

//alphabet.removeLast()
//print(alphabet)
//alphabet.removeLast(2)

// 전체 삭제
alphabet.removeAll()

//alphabet.removeFirst() 배열이 빈 상태에서 실행시 에러

alphabet.popLast() // 빈 배열일 경우 nil반환

alphabet = ["A", "B", "C", "D", "F", "G"]
alphabet.popLast()
print(alphabet)

alphabet.removeSubrange(0...2)
print(alphabet)



//--------------------------------------------------------------------<



// MARK: Comparing Arrays

let a = ["A", "B", "C"]
let b = ["a", "b", "c"]

// 스위프트는 대소문자를 구별함
a == b
a != b

a.elementsEqual(b)

a.elementsEqual(b) { (lhs, rhs) -> Bool in
    return lhs.
}
