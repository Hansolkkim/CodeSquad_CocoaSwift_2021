//
//  interestRate.swift
//  Week2_WedEx_1_2
//
//  Created by 김한솔 on 2021/11/10.
//
import Foundation

struct interestRate {
    
    func getInterestRate(byDay: Int) -> Double {
        
        var InterestRate: Double
        
        switch byDay {
            
        case 0...90 :
            InterestRate = 0.5 / 100
        case 91...180 :
            InterestRate = 1 / 100
        case 181...364 :
            InterestRate = 2 / 100
        case 365... :
            InterestRate = 5.6 / 100
        default :
            InterestRate = 0.0
        }
        
        return InterestRate
    }
    
    func calculateAmount(day: Int, amount: Int) -> Double {
        
        var calculatedAmount: Double
        let myInterestRate = getInterestRate(byDay: day)
        
        calculatedAmount = Double(amount) + (Double(amount) * myInterestRate)
        
        return calculatedAmount
    }
    
}
