//
//  validator.swift
//  enterPasswordApp
//
//  Created by 김한솔 on 2021/11/10.
//

import Foundation
import UIKit

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
    
    func setLevelElement(level: Int) -> (UIColor,String) {
        
        switch level {
        case 1 :
            return (UIColor.systemRed, "아주 약한 암호")
        case 2 :
            return (UIColor.systemOrange, "약한 암호")
        case 3 :
            return (UIColor.systemYellow, "보통 암호")
        case 4 :
            return (UIColor.systemBlue, "강한 암호")
        case 5 :
            return (UIColor.systemGreen, "아주 강한 암호")
        default :
            return (UIColor.black, "암호 수준")
        }
    }
    
    func randomPowerfulPassword() -> String {
        let wholeLetterArray = ["a","b",
                                "c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
        let specialCharacterArray = ["-","+","!","@","#","$","%"]
        var randomPassword = ""
        
        randomPassword.append(String(Int.random(in: 0...9)))
        randomPassword.append(wholeLetterArray[Int.random(in: 0...51)])
        randomPassword.append(specialCharacterArray[Int.random(in: 0...6)])
        
        while randomPassword.count <= 10 {
            let randomDigit = Int.random(in: 1...3)
            
            switch randomDigit {
            case 1 :
                randomPassword.append(String(Int.random(in: 0...9)))
            case 2 :
                randomPassword.append(wholeLetterArray[Int.random(in: 0...51)])
            case 3 :
                randomPassword.append(specialCharacterArray[Int.random(in: 0...6)])
            default :
                continue
            }
        }
        
           return randomPassword
    }
}
