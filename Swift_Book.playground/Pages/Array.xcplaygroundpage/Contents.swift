
import UIKit
/*
 배열은 single type
 0 Based index
 배열은 제네릭 형식
 */

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

let arr: [Int] = []

let adf = [1, "2"] as [Any]


// MARK: 배열에 값 넣기 (Put Values In Array)

// -<빈 배열 만들기>-
// 반드시 배열의 타입을 명시해야함.
//let emptyArray = [] // error: 타입 명시가 돼 있지 않음.

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


// MARK: 배열의 가변성 (Array Variability)

// 변수형 배열 (배열 생성 후 배열요소 변경가능)
var someArr1 = [1, 2, 3, 4, 5]
someArr1[0] = 0

// 상수형 배열 (배열 생성 후 배열요쇼 변경 불가능)
let someArr2 = [1, 2, 3, 4, 5]
//someArr2[0] = 0 // 상수형 배열로 생성했기에 변경 불가능


// MARK: 배열 검사 (Inspecting an Array)

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
// endIndex는 배열의 마지막 인덱스가 아님 (마지막 인덱스 다음임)
//fruits[fruits.endIndex] // error: 인덱스를 벗어남
fruits[fruits.index(before: fruits.endIndex)]

// -<속성 사용>-
// 배열의 시작과 마지막 인덱스에 접근할 때는 속성을 사용할 수 있음.
fruits.first // 시작 인덱스
fruits.last // 마지막 인덱스

// 배열이 비어있다면 nil을 반환
emptyArray.first
emptyArray.last

//emptyArray[0] // error: 배열에 값이 없음

// 속성 사용의 장점: 서브스크립트 문법은 배열이 비어있을 때 접근하면 에러가 나기에 불안전하지만, 속성은 nil을 반환하기에 안전함.


//--------------------------------------------------------------------<


//MARK: 배열 편집

// MARK: 요소 추가 (Adding Elements)

var alphabet = ["A", "B", "C"]

// append() == 하나의 요소를 추가할 때 사용
alphabet.append("E")
//alphabet.append(1) // error: 배열은 single type이기에 다른 값은 넣지못함

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



// MARK: Comparing Arrays (배열 비교)

let a = ["A", "B", "C"]
let b = ["a", "b", "c"]

// 스위프트는 대소문자를 구별함
a == b
a != b

// equal to 연산자와 동일함 (비교 연산자 '==')
a.elementsEqual(b)

// 후행 클로저 사용하여 요소를 비교하는 코드를 직접 구현
a.elementsEqual(b) { (lhs, rhs) -> Bool in
    return lhs.caseInsensitiveCompare(rhs) == .orderedSame // 같다면 true를 반환
}


// MARK: Finding Elements (요소 검색)

let number = [1, 2, 3, 1, 4, 5, 2, 6, 7, 5]

// 배열에 특정 요소가 저장되어있는지 확인할 때 사용하는 메서드
number.contains(1) // true
number.contains(10) // false

// 단순히 존재여부만 확인

// 직접 코드를 구현하여 확인
number.contains { (n) -> Bool in
    print(n)
    return n % 2 == 0
}

// 첫번째 요소값을 반환
number.first

// 가장 먼저 검색된 배열의 요소 값을 반환
number.first { (n) -> Bool in
    return n % 2 == 0
}

// 가장 먼저 검색된 배열의 인덱스를 반환 (직접 구현)
number.firstIndex { (n) -> Bool in
    return n % 2 == 0
}

// 가장 먼저 검색된 배열의 인덱스를 반환
number.firstIndex(of: 1) // 요소 1의 인덱스는 0이기에 0이 반환

// 마지막도 있으나 first와 동일
number.last

number.last { (n) -> Bool in
    return n % 2 == 0
}

// 이건 뭐.... 쓸모없지않나?... 크흠
number.lastIndex(of: 2)

//
number.lastIndex { (n) -> Bool in // 6의 인덱스는 7
    return n % 2 == 0
}


// MARK: Sorting on Array


//클로저때 사용했던 sorted메서드와 연관지으면 될 듯 ^^...
// sort => 배열을 직접 정렬
// sorted => 정렬된 새로운 배열을 반환

number.sorted()
number

number.sorted { (a, b) -> Bool in
    return a > b
}

number.sorted().reversed()
[Int](number.sorted().reversed())

var mutableNums = number

mutableNums.sort()
mutableNums.reverse()

mutableNums
mutableNums.swapAt(0, 1)

mutableNums.shuffle()
