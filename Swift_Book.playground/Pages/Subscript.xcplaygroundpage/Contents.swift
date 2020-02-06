
import UIKit

/*
 instace[index]
 instace[key]
 instace[range]
 */

/* 선언 방법 (읽기전용 서브스크립트도 있음)
 subscript(parameters) -> ReturnType {
     get {
         return expression
     }
     set(name) {
         statements
     }
 }
 */

// 서브스크립트는 파라미터의 기본값은 저장 불가능
// 서브스크립트를 통해 값을 받아야 하기에 파라미터 생략 불가능
// 반환 값을 저장하는 값의 자료형으로 사용하기에, 반환 값 생략 불가능
 
class List {
    var data = [1, 2, 3]
    
    subscript(i index: Int) -> Int {
        get {
            return data[index]
        }
        
        set {
            data[index] = newValue
        }
    }
}

let l = List()

// 서브스크립트는 파라미터 이름이 Argument Label로 사용되지 않음.
//l[1] // Argument Label이 없을 경우 ("l[index: 1]"이렇게는 사용안함.)
l[i: 1]
l[i: 1] = 123
l[i: 1]
//l[0, 1] // error: 파라미터가 일치하는 서브스크립트가 없기에 에러

// 서브스크립트에서는 Argumet Label 사용이 적음
// 두 개 이상의 파라미터가 선언되어 있고, 파라미터의 가독성을 높여주고 싶을 때 사용

struct Matrix {
    var data = [[1, 2, 3],
                [4, 5, 6],
                [7, 8, 9]]
    
    subscript(row: Int, col: Int) -> Int {
        
        if (row >= data.count || col >= data[row].count) {
            print("index out of range!")
            return 0
        }
        
        return data[row][col]
    }
}

let m = Matrix()
// 두 개 이상의 파라미터를 전달할 때는 콤마를 사용하여 구분
m[0, 0]
m[3, 3]
