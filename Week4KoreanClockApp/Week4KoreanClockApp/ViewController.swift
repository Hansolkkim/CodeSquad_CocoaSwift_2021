//
//  ViewController.swift
//  Week4KoreanClockApp
//
//  Created by 김한솔 on 2021/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var noonLabelView: [UILabel]!
    @IBOutlet weak var blankLabelView: UILabel!
    @IBOutlet var hourLabelView: [UILabel]!
    @IBOutlet weak var dayOrNightLabelView: UILabel!
    @IBOutlet var minuteSecondDigitLabelView: [UILabel]!
    @IBOutlet var minuteFirstDigitLabelView: [UILabel]!
    @IBOutlet var secondLabelView: [UILabel]!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.myTimer(_:)), userInfo: nil, repeats: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        blankLabelView.text = " "
        for i in hourLabelView { i.textColor = .systemGray }
        for i in minuteSecondDigitLabelView { i.textColor = .systemGray }
        for i in minuteFirstDigitLabelView { i.textColor = .systemGray }
    }
    @objc private func myTimer(_ sender: Timer) {
        let currentDate = Date()
        let calendar = Calendar(identifier: .gregorian)
        let dateComponents = calendar.dateComponents([.hour, .minute, .second], from: currentDate)
        for i in hourLabelView { i.textColor = .systemGray }
        for i in minuteSecondDigitLabelView { i.textColor = .systemGray }
        for i in minuteFirstDigitLabelView { i.textColor = .systemGray }
        let hourString = "\(dateComponents.hour ?? 0)"
        let minuteString = "\(dateComponents.minute ?? 0)"
        let secondString = "\(dateComponents.second ?? 0)"
        controlNoon(hourString)
        controlHour(hourString)
        controlDayOrNight(hourString)
        controlMinute(minuteString)
        controlSecond(secondString)
    }
    
    func controlNoon(_ currentHour: String) {
        guard let currentHour = Int(currentHour) else {return}
        noonLabelView[0].textColor = .black
        if currentHour < 12 {
            noonLabelView[1].textColor = .black
            noonLabelView[2].textColor = .systemGray
        } else {
            noonLabelView[1].textColor = .systemGray
            noonLabelView[2].textColor = .black
        }
    }
    func controlHour(_ currenthour: String) {
        
        let currentHour = Int(currenthour)!>12 ? Int(currenthour)! - 12 : Int(currenthour)!
        for i in hourLabelView { i.textColor = .systemGray }
        hourLabelView[14].textColor = .black
        if currentHour >= 10 {
            hourLabelView[0].textColor = .black
        }
        switch currentHour%10 {
        case 1: hourLabelView[1].textColor = .black
        case 2: hourLabelView[2].textColor = .black
        case 3: hourLabelView[3].textColor = .black
        case 4: hourLabelView[4].textColor = .black
        case 5:
            hourLabelView[5].textColor = .black
            hourLabelView[7].textColor = .black
        case 6:
            hourLabelView[6].textColor = .black
            hourLabelView[7].textColor = .black
        case 7:
            hourLabelView[8].textColor = .black
            hourLabelView[9].textColor = .black
        case 8:
            hourLabelView[10].textColor = .black
            hourLabelView[11].textColor = .black
        case 9:
            hourLabelView[12].textColor = .black
            hourLabelView[13].textColor = .black
        default :
            hourLabelView[14].textColor = .black
        }
    }
    func controlDayOrNight(_ currenthour: String) {
        switch Int(currenthour)! {
        case 7...18: dayOrNightLabelView.text = "☀️"
        default : dayOrNightLabelView.text = "🌙"
        }
    }
    func controlMinute(_ currentMinute: String) {
        guard let currentMinute = Int(currentMinute) else { return }
        if currentMinute > 19{
            minuteSecondDigitLabelView[4].textColor = .black
            minuteSecondDigitLabelView[currentMinute/10 - 2].textColor = .black
        }
        if currentMinute >= 10 && currentMinute < 20{ minuteSecondDigitLabelView[4].textColor = .black }
        if currentMinute%10 != 0 {
            minuteFirstDigitLabelView[currentMinute%10-1].textColor = .black
        }
        minuteFirstDigitLabelView[9].textColor = .black
    }
    func controlSecond(_ currentSecond: String) {
        guard let currentSecond = Int(currentSecond) else {return}
        var outputString1 = ""
        var outputString2 = ""
        if currentSecond >= 10 {
            switch currentSecond/10 {
            case 2 : outputString1.append("이")
            case 3 : outputString1.append("삼")
            case 4 : outputString1.append("사")
            case 5 : outputString1.append("오")
            default: outputString1.append("")
            }
            outputString1.append("십")
        }
        switch currentSecond % 10 {
        case 1 : outputString2.append("일")
        case 2 : outputString2.append("이")
        case 3 : outputString2.append("삼")
        case 4 : outputString2.append("사")
        case 5 : outputString2.append("오")
        case 6 : outputString2.append("육")
        case 7 : outputString2.append("칠")
        case 8 : outputString2.append("팔")
        case 9 : outputString2.append("구")
        default : outputString2.append("")
        }
        outputString2.append("초")
        if currentSecond == 0 {
            secondLabelView[0].text = "정"
            secondLabelView[1].text = "각"
        } else {
            if currentSecond >= 10 {
                secondLabelView[0].text = outputString1
                secondLabelView[1].text = outputString2
            } else {
                secondLabelView[0].text = "  "
                secondLabelView[1].text = outputString2
            }
        }
    }

}

