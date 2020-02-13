
import UIKit

// MARK: Deinitializer (소멸자)

/*
 소멸자는 클래스의 인스턴스가 메모리에서 소멸되기 바로 직전에 호출됨
 'deinit'키워드를 사용하여 소멸자를 구현할 시 자동으로 호출이됨
 소멸자는 클래스의 인스턴스에만 구현할 수 있음
 소멸자는 클래스에서 단 하나만 구현 가능, 매개변수를 가지지 않음, 소괄호도 적지 않음, 자동으로 호출되기에 별도의 코드로 호출X
 소멸자는 인스턴스를 소멸하기 직전에 호출되므로 인스턴스의 모든 프로퍼티에 접근 할 수 있음, 프로퍼티의 값을 변경할 수도 있음
 */

/*
 deinit {
     statements
 }
 */

class SomeClass {
    deinit {
        print("Instance will be deallocated immediately")
    }
}


var instance: SomeClass? = SomeClass()
instance = nil

class FileManager {
    var fileName: String
    
    init(fileName: String) {
        self.fileName = fileName
    }
    
    func openFile() {
        print("Open File: \(self.fileName)")
    }
    
    func modifyFile() {
        print("Modify File: \(self.fileName)")
    }
    
    func writeFile() {
        print("Write File: \(self.fileName)")
    }
    
    func closeFile() {
        print("Close File: \(self.fileName)")
    }
    
    deinit {
        print("Deinit instance")
        self.writeFile()
        self.closeFile()
    }
}

var fileManager: FileManager? = FileManager(fileName: "TEST.txt")

if let manager: FileManager = fileManager {
    manager.openFile()
    manager.modifyFile()
}

fileManager = nil



