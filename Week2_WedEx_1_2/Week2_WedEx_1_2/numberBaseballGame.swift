//
//  numberBaseballGame.swift
//  Week2_WedEx_1_2
//
//  Created by 김한솔 on 2021/11/10.
//

import Foundation

struct numberBaseballGame {
    var correctAnswer: Int!
    var countPlayedTimes: Int = 0
    var isStrike_3: Int = 0
    
    mutating func newGame() {
        var tempNum = Int.random(in: 100...999)
        
        //같은 숫자가 두개 이상 나오면 계속해서 random 돌려줌
        while tempNum/100 == (tempNum%100)/10 || tempNum/100 == (tempNum%10) || (tempNum%100)/10 == tempNum%10 {
            tempNum = Int.random(in: 100...999)
        }
        
        self.correctAnswer = tempNum
    }
    
    mutating func hit(num: Int) -> (strikeCount: Int, ballCount: Int) {
        
        let correctAnswerArr: [Int] = [correctAnswer/100, (correctAnswer%100)/10, (correctAnswer%10)]
        let myAnswerArr: [Int] = [num/100, (num%100)/10, (num%10)]
        var strikeCount = 0, ballCount = 0
        
        for i in 0...2 {
            
            if  myAnswerArr[i] == correctAnswerArr[i] {
                strikeCount += 1
            }
            for j in 0...2 {
                
                if i != j && myAnswerArr[i] == correctAnswerArr[j] {
                    ballCount += 1
                }
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
}
