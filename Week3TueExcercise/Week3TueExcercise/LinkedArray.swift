//
//  LinkedArray.swift
//  Week3TueExcercise
//
//  Created by 김한솔 on 2021/11/16.
//

import Foundation

class LinkedArray {
    var A = [Int](repeating: 0, count: 10)
    var valueArray = [Int]()
    var cnt = 1
    
    init() {
        self.A[0] = 1
        self.A[A.endIndex-1] = -1
        }
    
    func append(_ value: Int) {
        var nextIndex = Int.random(in: 2...9)
        while A.contains(nextIndex) {
            nextIndex = Int.random(in: 2...9)
        }
        A[self.cnt] = nextIndex
        self.cnt += 1
        valueArray.append(value)
    }
    
    func enumerateList(_ A: [Int]) {
        var flowArray = [Int]()
        flowArray.append(1)
        var a = 1
        while a != -1 {
            flowArray.append(A[a])
            a = A[a]
        }
        for i in 0..<flowArray.count-1 {
            print(flowArray[i], terminator: " -> ")
        }
        print(flowArray[flowArray.count-1])
    }
    
    func countOfList(_ A : [Int]) -> Int {
        return A.count
    }
    func isFullList(_ A : [Int]) -> Bool {
        return A.count == self.valueArray.count
    }
}
