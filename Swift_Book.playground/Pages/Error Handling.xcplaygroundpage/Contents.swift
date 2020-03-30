
import Foundation

// MARK: Error Handling

/*
 * 에러를 전달
 throw expression

 * 함수(메서드) - Throwing Function / Method
 func name(parameters) throws -> ReturnType {
     statements
 }
 
 * 생성자 - Throwing Initializer
 init(parameters) throws {
     statements
 }

 * 클로저 - Throwing Closure
 { (parameters) throws -> ReturnType in
     statements
 }
 
 + throw 와 throws는 다름
 */

enum DataParsingError: Error {
    case invalidType
    case invalidField
    case missingRequiredField(String)
}

// throw는 에러가 발생한 경우에만 호출되어야 함
func parsing(data: [String: Any]) throws {
    guard let _ = data["name"] else {
        throw DataParsingError.missingRequiredField("name")
    }
    
    guard let _ = data["age"] as? Int else {
        throw DataParsingError.invalidType
    }
    
    // Parsing Statements
}

// MARK: - try Statements

/*
 try expression
 try? expression - 'Optional try' (표현식에서 에러가 날 경우, nil을 반환함)
 try! expression - 'Forced try' (에러가 발생할 경우, 런타임 에러가 발생함)
 */

// throws 키워드가 붙은 함수, 메서드, 생성자, 클로저는 반드시 try 표현식으로 호출해야함

try? parsing(data: [:])

/*
 *에러를 처리하는 방법
 
 1. do-catch Statements (코드에서 발생한 에러를 개별적으로 처리할 때 사용)
 2. try Expression + Optional Binding
 3. hand over (전달 받은 에러를 다른 코드블록으로 전달)
 
 */

// MARK: - do-catch Statements


// 패턴이 생략된 catch 블록은 가장 마지막에 작성해야함
// 패턴이 있는 경우에는, 가장 까다로운 패턴부터 작성해야함

/*
 do {
     try parsing(data: ["name": ""])
 } catch DataParsingError.invalidType {
     print("invalid type error")
 } catch {
     print("handle error")
 }
 */

// do-catch 문은 반드시 do블록에서 발생할 수 있는 모든 에러를 catch블록에서 처리해야함

/* 에러 발생 코드
 func handleError() {
     do {
         try parsing(data: ["Name": ""])
     } catch DataParsingError.invalidType {
         print("invalid type error")
     }
 }
 */

func handleError() throws {
    do {
        try parsing(data: ["Name": ""])
    } catch {
        if let error = error as? DataParsingError {
            switch error {
            case .invalidType:
                print("invalid type")
            default:
                print("handle error")
            }
        }
    }
}

// MARK: - Optional try

/*
 try? expression => Optional try
 try! expression => Forced try
 */

if let _ = try? parsing(data: [:]) {
    print("success")
} else {
    print("Fail")
}

do {
    try parsing(data: [:])
    print("success")
} catch {
    print("Fail")
}

try? parsing(data: [:])

/*
 
 * Forced try는 표현식에서 발생한 에러를 다른 곳으로 전달할 수 없음
 * do-catch를 통해 에러를 처리하는 것도 불가능
 * 가능한 사용하지 않는것을 권장 (에러가 발생하지 않는것이 확실한 경우에만 제한적으로 사용해야함)
 
 */
//try! parsing(data: [:]) // 런타임 에러!
