
import UIKit

// MARK: Set Type

// Set은 배열 리터럴을 사용
// 검색 속도가 더 중요할 경우 주로 사용

let arr = [1, 2, 3, 4, 5, 6]
arr.count


let set: Set<Int> = [1, 2, 2, 3, 3, 3]
// Set은 배열과 달리 중복된 요소를 허용안함
set.count

// Set은 형식추론 사용불가
// 요소의 자료형은 생략 가능
let set2: Set = [1, 1, 2, 2, 3, 3]

// MARK: Inspecting a Set

set2.count

set2.isEmpty

// MARK: Testing for Membership

// Hash알고리즘을 사용하기 때문에 배열과 동일한 메서드임에도 더 빠름
set.contains(1)

// MARK: Adding and Removing Elements

var words = Set<String>()

var insertResult = words.insert("Swift")
insertResult.inserted
insertResult.memberAfterInsert
 
// 중복된 값은 허용안함
insertResult = words.insert("Swift")
insertResult.inserted
insertResult.memberAfterInsert

// 값이 없다면 새로 추가하고, 있다면 교체 (Upsert)
var updateResult = words.update(with: "Swift")
updateResult

// nil이 반환되면 insert, 문자열이 반환되면 update
updateResult = words.update(with: "Apple")
updateResult
 
words
words.remove("Swift")
words

// 존재하지 않는 값은 nil반환
words.remove("Ghost")

// 전체 삭제
words.removeAll()
words

// MARK: Set비교

var a: Set = [1, 2, 3, 4, 5, 6, 7, 8, 9]
var b: Set = [1, 3, 5, 7, 9]
var c: Set = [2, 4, 6, 8, 10]
var d: Set = [1, 7, 5, 9, 3]

a == b
a != b

// Set은 정렬되지 않은 컬렉션
b == d

// 순서대로 비교하기에 값이 바뀜
b.elementsEqual(d)

// Set은 집합 비교에 특화

// a는 자신의 부분 집합이기에 true를 반환
a.isSubset(of: a)

// 진부분 집합은 아니기에 false를 반환
a.isStrictSubset(of: a)

b.isSubset(of: a) // 상위 집합
b.isStrictSubset(of: a) // 진상위 집합

a.isSuperset(of: a)
a.isStrictSuperset(of: a)

a.isSuperset(of: b)
a.isStrictSuperset(of: b)

a.isSuperset(of: c)
a.isStrictSuperset(of: c)

// 교집합이면 false를 반환, 서로소이면 true를 반환
a.isDisjoint(with: b)
a.isDisjoint(with: c)
b.isDisjoint(with: c) // 서로소


// MARK: 집합 연산

a = [1, 2, 3, 4, 5, 6, 7, 8, 9]
b = [1, 3, 5, 7, 9]
c = [2, 4, 6, 8, 10]

// 합집합
// union메서드는 기존값을 바꾸지 않고 새로운 Set을 반환
var result = b.union(c)
result = b.union(a)

// form으로 시작하는 메서드는 원본을 직접 변경함
b.formUnion(c)
b

a = [1, 2, 3, 4, 5, 6, 7, 8, 9]
b = [1, 3, 5, 7, 9]
c = [2, 4, 6, 8, 10]

// 교집합
// 새로운 Set으로 반환
result = a.intersection(b)

// 교집합이 아닐 경우 빈 Set 반환
result = c.intersection(b)

// a에는 교집합만 있게됨
a.formIntersection(b)
a

b.formIntersection(c)
b

a = [1, 2, 3, 4, 5, 6, 7, 8, 9]
b = [1, 3, 5, 7, 9]
c = [2, 4, 6, 8, 10]

// 여집합
result = a.symmetricDifference(b)

result = c.symmetricDifference(b)

a.formSymmetricDifference(b)

a = [1, 2, 3, 4, 5, 6, 7, 8, 9]
b = [1, 3, 5, 7, 9]
c = [2, 4, 6, 8, 10]

// 차집합
result = a.subtracting(b)

// 차집합은 원본을 변경하려면 substract메서드를 사용해야함 (form접두어 메서드X)
a.subtract(b)
