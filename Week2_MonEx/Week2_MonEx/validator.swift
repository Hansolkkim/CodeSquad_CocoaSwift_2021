//
//  validator.swift
//  Week2_MonEx
//
//  Created by 김한솔 on 2021/11/08.
//

import Foundation
/* 연습문제 2. 아이디 규칙 검사*/

struct Validator {
    
    func getID() -> String {
        
        print("아이디를 입력하세요 : ", terminator: "")
        let ID = readLine()!
        
        return ID
    }
    
    func IDValidator(ID: String) -> Bool {
        
        if ID.count < 5 || ID.count >= 24 {
            return false
        }
        for i in 0..<ID.count {
            let bit = ID[ID.index(ID.startIndex, offsetBy: i)]
            if bit.isNumber || bit.isLetter || bit.asciiValue! == 45 {
                
            }else {
                return false
            }
            if bit.isNumber && i != ID.count-1 {
                let nextbit = ID[ID.index(ID.startIndex, offsetBy: i+1)]
                if nextbit == bit {
                    let nextnextbit = ID[ID.index(ID.startIndex, offsetBy: i+2)]
                    if nextbit == nextnextbit {
                        return false
                    }
                }else if nextbit.asciiValue! - 1 == bit.asciiValue! {
                    let nextnextbit = ID[ID.index(ID.startIndex, offsetBy: i+2)]
                    if nextbit.asciiValue! == nextnextbit.asciiValue! - 1 {
                        return false
                    }
                }
            }

        }
        return true
    }
    
    func printIDValidator(resultIDValidation: Bool) {
        if resultIDValidation == true {
            print("아이디가 규칙에 맞습니다.")
        } else {
            print("아이디가 규칙에 맞지 않습니다.")
        }
    }
}
