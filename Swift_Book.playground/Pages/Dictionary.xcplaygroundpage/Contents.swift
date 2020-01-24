
import UIKit

// 키과 값이 하나의 요소로 저장됨.
var dict = ["A": "Apple", "B": "Banana"]

// 빈 딕셔너리
// dict = [] // 이건 빈 배열임
dict = [:]

// Dictionary[Key: Value]

// 정식 문법
let dict1: Dictionary<String, Int>

// 단축 문법
let dict2: [String: Int]

// MARK: 딕셔너리 만들어 보기
let words = ["A": "Apple", "B": "Banana", "C": "City"]

//let emptyDict = [:] // error: 타입 명시가 안되어 있음
let emptyDict1: [String: String] = [:]

// 빈 배열: 단축 문법
let emptyDict2 = [String: String]()

// 빈 배열: 정식 문법
let emptyDict3 = Dictionary<String, String>()

// MARK: Insepecting Dictionary

words.count // 저장된 요소의 갯수 확인 (배열과 동일)
words.isEmpty


// MARK: 요소 접근

// 서브스크립트
words["A"]
words["Apple"] // "Apple"이라는 키는 없기에 nil을 반환

let a = words["E"] // a의 자료형은 옵셔널 String

// 기본값
let b = words["E", default: "Empty"] // b의 자료형은 String

// 딕셔너리는 순서가 없음.

for k in words.keys.sorted() {
    print(k)
}

for v in words.values {
    print(v)
}

// 배열로 바꾸기
let keys = Array(words.keys)
let values = Array(words.values)
