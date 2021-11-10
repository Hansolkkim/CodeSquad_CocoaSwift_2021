//
//  validator.swift
//  enterPasswordApp
//
//  Created by 김한솔 on 2021/11/10.
//

import Foundation

struct validator {
    
    
    
    func passwordValidator(password: String) -> Int {
        let numberCharacterset: CharacterSet = CharacterSet(charactersIn: "0123456789")
        let letterCharacterset: CharacterSet = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
        let symbolCharacterset: CharacterSet = CharacterSet(charactersIn: "-+!@#$%")
        let numberAndLetterCharacterset: CharacterSet = numberCharacterset.union(letterCharacterset)
        var grade = 0
        let length = password.count
        let passwordSet = CharacterSet(charactersIn: password)

        if length < 8 { //password 길이가 8글자 미만
            
            if passwordSet.intersection(numberAndLetterCharacterset) != [] {
                grade += 1
                if passwordSet.intersection(letterCharacterset) != [] {
                    grade += 1
                    if passwordSet.intersection(symbolCharacterset) != [] {
                        grade += 1
                    }
                } else if passwordSet.intersection(symbolCharacterset) != [] {
                    grade += 2
                }
            } else if passwordSet.intersection(symbolCharacterset) != [] {
                grade = 3
            }
            
        } else if length >= 8 { //password 길이가 8글자 이상
            grade = 2 // 최소 2 Level
            
            if passwordSet.intersection(numberAndLetterCharacterset) != [] {
                grade += 1
                if passwordSet.intersection(letterCharacterset) != [] && passwordSet.intersection(numberCharacterset) != [] {
                    grade += 1
                    if passwordSet.intersection(symbolCharacterset) != [] {
                        grade += 1
                    }
                } else if passwordSet.intersection(symbolCharacterset) != [] {
                    grade = 3
                }
                
            }
        }
        
        return grade
    }
    
    
}
