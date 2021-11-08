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
/* 연습문제3. 비밀번호 등급 확인*/
    func getPassword() -> String {
        print("비밀번호를 입력하세요 : ", terminator: "")
        let password = readLine()!
        return password
    }
    
    func passwordValidator(password: String) -> Int {
        
        var grade = 0
        let length = password.count
        var bitIsNumber = 0, bitIsLetter = 0, bitIsSymbol = 0
        if length < 8 {
            for bit in password {
                if bit.isNumber {
                    bitIsNumber += 1
                } else if bit.isLetter {
                    bitIsLetter += 1
                }
            }
            if bitIsNumber == length {
                grade += 1
            }else if bitIsLetter == length {
                grade += 2
            }
        } else if password.count >= 8 {
            grade = 3
            for bit in password {
                if bit.isNumber {
                    bitIsNumber += 1
                    continue
                } else if bit.isLetter {
                    bitIsLetter += 1
                    continue
                } else if bit.isSymbol || (bit.asciiValue! > 32 && bit.asciiValue! < 48) {
                    bitIsSymbol += 1
                }
            }
            if bitIsNumber > 0 && bitIsLetter > 0 {
                grade += 1
                if bitIsSymbol > 0 {
                    grade += 1
                }
            }
        }
        
        return grade
    }
    
    func printPasswordValidator(input: Int) {
        print("당신의 Password 보안 등급은 \(input)등급입니다.")
    }

/* 연습문제4. 주민번호 판별 검사*/
    func getSocialNum() -> String {
        
        print("주민등록번호 13자리를 입력해주세요 (-는 제외해주세요) : ", terminator: "")
        let socialNumber = readLine()!
        
        return socialNumber
    }
    
    func socialNumValidator(socialNum: String) -> Bool {
        
        if socialNum.count != 13 {
            return false
        } else {
            var N: Int = 0
            let socialBit: [Int] = socialNum.map { Int(String($0)) ?? 0}
            
            var a = 2
            for i in 0...7 {
                N += a * socialBit[i]
                a += 1
            }
            a = 2
            for i in 8...11{
                N += a * socialBit[i]
                a += 1
            }
            let K = (11 - (N % 11)) % 10
            if K == socialBit[12] {
                return true
            } else {
                return false
            }
        }
    }
    func printSocialNumValidator(input: Bool) {
        
        if input == true {
            print("정상적인 주민등록번호임이 확인되었습니다.")
        } else {
            print("잘못된 주민등록번호입니다.")
        }
    }
}
