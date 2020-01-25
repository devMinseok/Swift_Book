
import UIKit

// MARK: 새로운 요소 추가
var words = [String: String]()

// 키와 값 추가
words["A"] = "Apple" // A라는 키와 Apple라는 값이 한 요소로 저장
words["B"] = "Banana"

words.count
words

// 키가 존재하지 않는 경우에는 새로운 요소를 추가하고, 키가 존재한다면 기존 값을 교체
words["B"] = "Ball"

words.count
words

// 메서드 사용

// Insert: 키가 존재하지 않으면 새로운 요소를 추가
words.updateValue("City", forKey: "C")

// Update: 키가 존재한다면 기존 값을 교체
words.updateValue("Circle", forKey: "C")

// insert + update = Upsert

// MARK: 요소 삭제

// 키도 같이 삭제 (같은 하나의 요소이기에
words["B"] = nil
words

// 존재하지 않는 키라도 에러는 발생안함
words["Z"] = nil

// 위와 동일
words.removeValue(forKey: "A")
words

words.removeValue(forKey: "A")

// 전부 삭제
words.removeAll()

// MARK: 비교

let a = ["A": "Apple", "B": "Banana", "C": "City"]
var b = ["A": "Apple", "C": "City", "B": "Banana"]

// 딕셔너리는 정렬되지 않은 컬렉션이기에 순서는 상관없음
a == b // 순서는 상관 없기에 true
a != b

b = ["A": "apple", "C": "city", "B": "banana"] // 소문자로 저장

// 대소문자는 구별함
a == b
a != b

// 키를 정렬하지 않고 비교했기에 X
//a.elementsEqual(b) { (lhs, rhs) -> Bool in
//    print(lhs.key, rhs.key)
//    return lhs.key.caseInsensitiveCompare(rhs.key) == .orderedSame && lhs.value.caseInsensitiveCompare(rhs.value) == .orderedSame
//}

// 정렬 후 비교
let aKeys = a.keys.sorted()
let bKeys = b.keys.sorted()

aKeys.elementsEqual(bKeys) { (lhs, rhs) -> Bool in
    guard lhs.caseInsensitiveCompare(rhs) == .orderedSame else {
        return false
    }
    
    guard let lv = a[lhs], let rv = b[rhs], lv.caseInsensitiveCompare(rv) == .orderedSame else {
        return false
    }
    
    return true
}

// 딕셔너리는 정렬되있지 않음.

// MARK: 요소 검색

words = ["A": "Apple", "B": "Banana", "C": "City"]

let c: ((String, String)) -> Bool = {
    $0.0 == "B" || $0.1.contains("i")
}

words.contains(where: c)

let r = words.first(where: c)
r?.key
r?.value

words.filter(c)

