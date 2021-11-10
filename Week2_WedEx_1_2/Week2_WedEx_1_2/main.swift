//
//  main.swift
//  Week2_WedEx_1_2
//
//  Created by 김한솔 on 2021/11/10.
//

import Foundation

func testInterest(unitDay: Int) -> Double {
    
    let myAmount:Double
    let testInterestRate = interestRate()
    
    myAmount = testInterestRate.calculateAmount(day: unitDay, amount: 1000000)
    
    return myAmount
}

var someInterestRate = interestRate()

print("당신의 예금 거치 기간을 입력하세요. : ", terminator: "")
let myDay = Int(readLine() ?? "") ?? 0
let myInterestRate = someInterestRate.getInterestRate(byDay: myDay)

print("당신의 이자율은 \(myInterestRate*100)% 입니다.")

print("당신의 원금을 입력하세요. : ", terminator: "")
let myCalculatedAmount = someInterestRate.calculateAmount(day: myDay, amount: Int(readLine() ?? "") ?? 0)
print("당신의 예치 계산 금액은 \(myCalculatedAmount)원 입니다.")

print("100만원 예치시, 단위 기간에 따른 예치 계산을 확인하고 싶으시면 단위기간을 입력하세요. : " , terminator:  "")
let myUnitDay = Int(readLine() ?? "") ?? 0

for day in stride(from: 1, to: 365, by: myUnitDay) {
    
    print("\(day)일 : \(testInterest(unitDay: day))원")
}
print("365일 : \(testInterest(unitDay: 365))원")
