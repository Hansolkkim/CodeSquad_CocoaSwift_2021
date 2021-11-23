//
//  main.swift
//  Week4TueExercise
//
//  Created by 김한솔 on 2021/11/23.
//

import Foundation

/* 연습문제 - 스레드 생성하기 */

class BackgroundWork {
    var thread: Thread? = nil
    
    func doTimeConsumingOperation(operation: Any?) {
        thread = Thread(target: self, selector: #selector(BackgroundWork.runHelper), object: operation)
        thread?.start()
    }

    @objc func runHelper(operation : Any?) {
            autoreleasepool { () in
                //operation.doOperation()
                print("Other thread is running...")
            }
    }
}
let some = BackgroundWork()
some.doTimeConsumingOperation(operation: nil)


/* 파일 시스템 탐색하기 */

func displayAllFiles(at path : String) {
    
    let myFileManager = FileManager.default
    do {
        let contents = try myFileManager.contentsOfDirectory(atPath: path)
        print(contents)
    } catch let error as NSError {
        print("Error access directory : \(error)")
    }
}

let myPath = "/System/Library/Desktop Pictures"
displayAllFiles(at: myPath)
