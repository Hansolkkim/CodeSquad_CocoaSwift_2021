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
        let unconvertedVal = Float(unconvertedValue.text!) ?? 0
        let convertedVal = convertToInches(fromCM: unconvertedVal)
        convertedValue.text = String(convertedVal)
    }
    
    func convertToInches(fromCM: Float) -> Float {
        var result: Float = 0
        result = fromCM / 2.54
        return result
    }
    
}

