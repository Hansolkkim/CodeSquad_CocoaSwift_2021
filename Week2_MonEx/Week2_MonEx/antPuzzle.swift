//
//  antPuzzle.swift
//  Week2_MonEx
//
//  Created by 김한솔 on 2021/11/08.
//

import Foundation

struct antPuzzle {
    
    func antFunction(inputArray: Array<Int>) -> Array<Int> {
    
        var myValue = 0, mycnt = 1, myLocation = 0
        var outputArray: Array<Int> = [Int]()
        
        while myLocation <= inputArray.count-1 {
            
            myValue = inputArray[myLocation]
            if myLocation < inputArray.count-1 {
                for i in myLocation+1...inputArray.count-1 {
                    if myValue == inputArray[i] {
                        mycnt += 1
                        if i == inputArray.count-1 {
                            outputArray.append(myValue)
                            outputArray.append(mycnt)
                        }
                        
                    } else {
                        outputArray.append(myValue)
                        outputArray.append(mycnt)
                        break
                    }
                }
            } else {
                outputArray.append(myValue)
                outputArray.append(mycnt)
            }
            
            
            myLocation = myLocation + mycnt
            mycnt = 1
            
        }

        return outputArray
    }
}
