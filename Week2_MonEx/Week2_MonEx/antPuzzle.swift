//
//  antPuzzle.swift
//  Week2_MonEx
//
//  Created by 김한솔 on 2021/11/08.
//

import Foundation

struct antPuzzle {
    
    func antFunction(inputArray: Array<Int>) -> Array<Int> {
    
        var myValue = 0, mycnt = 1, myLocation = 0 //myValue : 직전값을 보관하는 변수, mycnt : 개수를 보관하는 변수(초깃값: 1)
        var outputArray: Array<Int> = [Int]()
        
        while myLocation <= inputArray.count-1 { //직전값의 위치가 배열의 맨 끝일 때까지
            
            myValue = inputArray[myLocation]
            
            if myLocation < inputArray.count-1 { //직전값의 위치가 배열의 맨 끝의 직전까지
                
                for i in myLocation+1...inputArray.count-1 { //직전값의 다음값부터 끝까지 비교
                    
                    if myValue == inputArray[i] { //직전값 = 비교하려는 값
                        
                        mycnt += 1
                        
                        if i == inputArray.count-1 { //비교하려는 값이 맨 끝자리 일 경우
                            
                            outputArray.append(myValue)
                            outputArray.append(mycnt)
                        }
                        
                    } else { // 직전값 != 비교하려는 값
                        
                        outputArray.append(myValue)
                        outputArray.append(mycnt)
                        break
                    }
                }
            } else { //직접값의 위치가 배열의 맨 끝일 때
                outputArray.append(myValue)
                outputArray.append(mycnt)
            }
            
            
            myLocation = myLocation + mycnt //직전값과 같은 값을 가졌던 자리 이후의 자리부터 다음 비교를 시작할것임
            mycnt = 1 //개수 보관 변수 초기화(1)
            
        }

        return outputArray
    }
}
