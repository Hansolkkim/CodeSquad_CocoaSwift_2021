//
//  BubbleSort.swift
//  Week3MonExercise
//
//  Created by 김한솔 on 2021/11/15.
//

import Foundation

class BubbleSort {
    var unsortedArray = [Int]()
    
    init() {
        print("거품 정렬을 원하는 숫자 배열을 입력해주세요. : ", terminator: "")
        self.unsortedArray = Array(readLine()!.split(separator: " ")).map { Int(String($0))! }
    }
    
    func sorted(isAscending: Bool) -> Array<Int> {
        let length = unsortedArray.count
        var forSortingArray = unsortedArray
        if isAscending {
            for i in 0...length-2 {
                for j in 0...length-2-i {
                    let leftElement = forSortingArray[j], rightElement = forSortingArray[j+1]
                    if leftElement > rightElement {
                        swap(aIndex: j, bIndex: j+1)
                    }
                }
            }
            
        } else {
            for i in 0 ... length-2 {
                for j in 0...length-2-i {
                    let leftElement = forSortingArray[j], rightElement = forSortingArray[j+1]
                    if leftElement < rightElement {
                        swap(aIndex: j, bIndex: j+1)
                    }
                }
            }
            
        }
        
        func swap(aIndex: Int, bIndex: Int) {
            let tmpElemnet = forSortingArray[aIndex]
            forSortingArray[aIndex] = forSortingArray[bIndex]
            forSortingArray[bIndex] = tmpElemnet
        }
        
        return forSortingArray
    }
}
