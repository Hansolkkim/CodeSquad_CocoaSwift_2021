//
//  SpecialBinary.swift
//  Week3MonExercise
//
//  Created by 김한솔 on 2021/11/15.
//

import Foundation

struct SpecialBinary {
    
    var total: Int
    var binaryArray = Array<String>()
    
    init(with total: Int) {
        self.total = total
        for i in 0...(count-1) {
            let tempArray = String(i, radix: 2)
            let length = tempArray.count
            switch length {
            case 1...(total-1):
                let zeroArray = String(repeating: "0", count: total - length) //total에 맞게 입력되는 2진수의 길이를 맞춰주는 switch문
                self.binaryArray.append(zeroArray+tempArray)
                
            default:
                self.binaryArray.append(tempArray)
            }
        }
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

        var bitcountArray = Array<String>()

        for i in 0..<count {
            let count1 = binaryArray[i].filter { $0 == "1" }.count
            if count1 == bitcount {
                bitcountArray.append(binaryArray[i])
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
