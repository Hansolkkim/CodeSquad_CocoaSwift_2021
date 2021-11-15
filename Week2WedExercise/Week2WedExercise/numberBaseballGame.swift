//
//  numberBaseballGame.swift
//  Week2_WedEx_1_2
//
//  Created by 김한솔 on 2021/11/10.
//

import Foundation

struct numberBaseballGame {
    var correctAnswer: [Int] = [0, 0, 0]
    var countPlayedTimes: Int = 0
    var isStrike_3: Int = 0
    
    mutating func newGame() {
        //숫자야구에서 각 자리의 숫자에는 0이 포함되지 않기때문에 tempNum과 correctAnswer을 [Int]로 설정
        var tempNum = [Int.random(in: 1...9), Int.random(in: 1...9), Int.random(in: 1...9)]
        
        //같은 숫자가 두개 이상 나오면 계속해서 random 돌려줌/ 조건에 따른 반복이므로 while문 사용
        while tempNum[0] == tempNum[1] || tempNum[0] == tempNum[2] || tempNum[1] == tempNum[2] {
            tempNum = [Int.random(in: 1...9), Int.random(in: 1...9), Int.random(in: 1...9)]
        }
        
        self.correctAnswer = tempNum
    }
    
    mutating func hit(num: Int) -> (strikeCount: Int, ballCount: Int) {
        
        let myAnswerArr: [Int] = [num/100, (num%100)/10, (num%10)]
        var strikeCount = 0, ballCount = 0
        
            for i in 0...2 {
            if  myAnswerArr[i] == correctAnswer[i] {
                strikeCount += 1
            } else if correctAnswer.contains(myAnswerArr[i]){
                ballCount += 1
            }
        }
        
        
        if strikeCount == 3 {
            self.isStrike_3 = 1
        } else {
            self.isStrike_3 = 0
        }
        self.countPlayedTimes += 1
            
        
        return (strikeCount, ballCount)
    }
    
    func showGameScore() -> Bool {
        
        return countPlayedTimes < 9 && isStrike_3 == 1
    }
    
    func getThreeNumber() -> Int {
        
        print("3자리 숫자를 입력하세요. : ",terminator: "")
        var myNumber = Int(readLine()!) ?? 0
        while (myNumber < 100) || (myNumber > 999) {
            print("3자리로 된 숫자만 입력하실 수 있습니다.")
            print("3자리 숫자를 입력하세요. : ",terminator: "")
            myNumber = Int(readLine()!) ?? 0
        }
        return myNumber
    }
}
