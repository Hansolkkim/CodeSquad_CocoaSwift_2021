//
//  main.swift
//  Week2_WedEx_1_2
//
//  Created by 김한솔 on 2021/11/10.
//

import Foundation


//연습문제 1 출력
var someInterestRate = interestRate()
let myDepositPeriod = someInterestRate.getPersonalDepositPeriod()
let myInterestRate = someInterestRate.getInterestRate(byDay: myDepositPeriod)
print("당신의 이자율은 \(myInterestRate*100)% 입니다.")
print("당신의 원금을 입력하세요. : ", terminator: "")
let myCalculatedAmount = someInterestRate.calculateAmount(day: myDepositPeriod, amount: Int(readLine() ?? "") ?? 0)
print("당신의 \(myDepositPeriod)동안의 예치 계산 금액은 \(myCalculatedAmount)원 입니다.")
print("100만원 예치시, 단위 기간에 따른 예치 계산 금액을 확인하고 싶으시면 단위 기간을 입력하세요. : " , terminator:  "")
for day in stride(from: 1, to: 365, by: Int(readLine()!) ?? 0) {
    print("\(day)일 : \(someInterestRate.testInterest(unitDay: day))원")
}
print("365일 : \(someInterestRate.testInterest(unitDay: 365))원") //단위 기간으로 조회하면 365일에 해당하는 날에서의 Caculated Amount는 볼 수 없어서 365일 때의 값도 출력해주도록 했음.

//연습문제2 출력
var myGame = numberBaseballGame()

myGame.newGame()

while myGame.isStrike_3 == 0 {
   
    let (myStrike,myBall) = myGame.hit(num: myGame.getThreeNumber()) //tuple로 hit함수의 반환값을 받음
    print("\(myStrike) Strike, \(myBall) Ball")
    print("플레이 횟수 : \(myGame.countPlayedTimes)\n")
}

    

print("정답은 \"\(myGame.correctAnswer[0]*100 + myGame.correctAnswer[1]*10 + myGame.correctAnswer[2])\" 이었습니다.")

if myGame.showGameScore() {
    print("Success!")
} else {
    print("Fail....")
}
