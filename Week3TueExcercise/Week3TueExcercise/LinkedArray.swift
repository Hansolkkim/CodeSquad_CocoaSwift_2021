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
    
    init() { //내 맘대로 A(List의 노드 값 중 다음 노드를 가리키는 포인터 값으로 이루어진 array)의 첫번째 요소 = 1, 마지막 요소 = -1 이라고 정해서 초기화함.
        self.A[0] = 1
        self.A[A.endIndex-1] = -1
        }
    
    func append(_ value: Int) { //append 함수가 호출되면, A에 임의의 값(2~9)을 입력하여, 다음 노드를 가리키는 포인터 값을 임의대로 지정함.
        var nextIndex = Int.random(in: 2...9)
        while A.contains(nextIndex) {
            nextIndex = Int.random(in: 2...9)
        }
        A[self.cnt] = nextIndex
        self.cnt += 1
        valueArray.append(value) // append의 매개변수에 입력된 값을 valueArray(List의 노드 값 중 저장된 값으로 이루어진 array)에 대입.
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
