//
//  SpecialBinary.swift
//  Week3MonExercise
//
//  Created by 김한솔 on 2021/11/15.
//

import Foundation

struct SpecialBinary {
    
    var total: Int
    
    init(with total: Int) {
        self.total = total
    }
    
    var count: Int {
        get {
            var cnt: Int = 1
            for _ in 1...total {
                cnt *= 2
            }
            return cnt
        }
    }
    
    func find(by bitcount: Int) -> Array<String> {
        var wholeArray = Array<String>()
        var bitcountArray = Array<String>()
        for i in 0...(count-1) {
            let tempArray = String(i, radix: 2)
            let length = tempArray.count
            switch length {
            case 1...(total-1):
                let zeroArray = String(repeating: "0", count: total - length) //total에 맞게 입력되는 2진수의 길이를 맞춰주는 switch문
                wholeArray.append(zeroArray+tempArray)
                
            default:
                wholeArray.append(tempArray)
            }
        }
        for i in 0..<count {
            var count1: Int = 0
            for j in 0..<total {
                let bit = wholeArray[i][wholeArray[i].index(wholeArray[i].startIndex, offsetBy: j)]
                if bit == "1" {
                    count1 += 1
                }
            }
            if count1 == bitcount {
                bitcountArray.append(wholeArray[i])
            }
        }
        return bitcountArray
    }

    func printFound(_ myArray: Array<String>) {
        print("[")
        for i in myArray {
            print("  \"\(i)\"")
        }
        print("]")
    }
}
