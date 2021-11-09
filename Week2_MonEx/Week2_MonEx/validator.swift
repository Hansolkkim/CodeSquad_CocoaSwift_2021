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
        
        if ID.count < 5 || ID.count >= 24 { //5글자 미만이거나 24글자 이상이면 실패
            
            return false
        }
        
        for i in 0..<ID.count { //영문 대소문자, 숫자, "-"만 포함 가능하고 그 외에는 실패
            
            let bit = ID[ID.index(ID.startIndex, offsetBy: i)]
            if bit.isNumber || bit.isLetter || bit.asciiValue! == 45 { //asciiValue == 45 : "-"
            }else {
                
                return false
            }
            
            if bit.isNumber && i != ID.count-1 { //ID의 i번째 요소의 값이 숫자이고, 마지막자리의 요소가 아닐 때
                
                let nextbit = ID[ID.index(ID.startIndex, offsetBy: i+1)]
                if nextbit == bit { //i번째 요소와 i+1번째 요소가 같은 숫자일 때
                    
                    let nextnextbit = ID[ID.index(ID.startIndex, offsetBy: i+2)]
                    if nextbit == nextnextbit { //i번째 요소, i+1번째, i+2번째 요소가 같은 숫자일 때 실패
                        
                        return false
                    }
                    
                }else if nextbit.asciiValue! - 1 == bit.asciiValue! { //(i번째 요소) + 1 = (i+1번쨰 요소)일 떄(i번째 요소가 숫자이면서)
                    
                    let nextnextbit = ID[ID.index(ID.startIndex, offsetBy: i+2)]
                    if nextbit.asciiValue! == nextnextbit.asciiValue! - 1 { //i번째 요소, i+1번째, i+2번째 요소가 오름차순 숫자일 때 실패
                        
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
        let numberCharacterset: CharacterSet = CharacterSet(charactersIn: "0123456789")
        let letterCharacterset: CharacterSet = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
        let symbolCharacterset: CharacterSet = CharacterSet(charactersIn: "`~!@#$%^&*()-_=+\\|]}[{'\";:/?.>,<")
        let numberAndLetterCharacterset: CharacterSet = numberCharacterset.union(letterCharacterset)
        let passwordSet = CharacterSet(charactersIn: password)

        if length < 8 { //password 길이가 8글자 미만
            
            if passwordSet.intersection(numberAndLetterCharacterset) != [] {
                grade += 1
                if passwordSet.intersection(letterCharacterset) != [] {
                    grade += 1
                    if passwordSet.intersection(symbolCharacterset) != [] {
                        grade += 1
                    }
                }
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
            let socialBit: [Int] = socialNum.map { Int(String($0)) ?? 0} //입력된 주민번호의 자릿수를 각각 하나의 원소로 갖는 배열 생성
            
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
