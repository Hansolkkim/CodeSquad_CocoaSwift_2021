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
            for _ in 0...length-1 {
                var swapped = false
                for i in 0...length-2 {
                    let leftElement = forSortingArray[i], rightElement = forSortingArray[i+1]
                    if leftElement > rightElement {
                        swap(aIndex: i, bIndex: i+1)
                        swapped = true
                    }
                }
                if swapped == false {
                    break
                }
            }
            
        } else {
            for _ in 0 ... length-1{
                var swapped = false
                for i in 0...length-2 {
                    let leftElement = forSortingArray[i], rightElement = forSortingArray[i+1]
                    if leftElement < rightElement {
                        swap(aIndex: i, bIndex: i+1)
                        swapped = true
                    }
                }
                if swapped == false {
                    break
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
