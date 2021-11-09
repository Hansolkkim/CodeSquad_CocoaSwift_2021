//
//  ViewController.swift
//  Week2_MeasureApp
//
//  Created by 김한솔 on 2021/11/09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var unconvertedValue: UITextField!
    @IBOutlet weak var convertedValue: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func typingCmValue(_ sender: Any) {
//        let unconveredVal = sender
    }
    @IBAction func convertButton(_ sender: UIButton) {
        
        let unconvertedVal = Measurement(value: Double(unconvertedValue.text!) ?? 0.0, unit: UnitLength.centimeters)
        let convertedVal = unconvertedVal.converted(to: UnitLength.inches)
        convertedValue.text = String(convertedVal.value) //Measurement를 사용하면 데이터 타입이 Measurement로 정해져서 그 값을 변환하기 어려웠음.
                                                     //String으로 변환하기 위해, convertedVal의 값만을 사용하는 convertedVal.value를 String으로 변환했음.
        
    }
    
}

