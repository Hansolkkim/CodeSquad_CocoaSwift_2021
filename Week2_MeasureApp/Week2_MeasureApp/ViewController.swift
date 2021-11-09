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
    }
    @IBAction func convertButton(_ sender: UIButton) {
        
        let str = unconvertedValue.text!
        var cntblank = 0
        
        if str.contains(" ") {
            cntblank = cntblank + 1
        }
        if cntblank == 0 {
            
            if str.contains("cm") {
                convertedValue.text = String(describing: ((str as NSString).floatValue / 100)) + "m"
            }else if str.contains("inch") {
                convertedValue.text = String(describing: (convertToCM(fromInches: (str as NSString).floatValue))) + "cm"
            }else if (str.contains("m")) && !(str.contains("c")) {
                convertedValue.text =  String(describing: ((str as NSString).floatValue * 100)) +  "cm"
            }
            
        } else {
            
            let devidedStr = str.split(separator: " ")
            var target : String = ""
            let characterSet = "abcdefghijklmnopqrstuvwxyz"
            for char in devidedStr[0] {
                
                if characterSet.contains(char) {
                    
                    target.append(char)
                }
            }
            
            switch (target, devidedStr[1]) {
                
            case("cm", "inch") :
                convertedValue.text = String(describing: (convertToInches(fromCM: (devidedStr[0] as NSString).floatValue))) + "inch"
            case("m", "inch") :
                convertedValue.text = String(describing: (convertToInches(fromCM: (devidedStr[0] as NSString).floatValue * 100))) + "inch"
            case("inch", "cm") :
                convertedValue.text = String(describing: (convertToCM(fromInches: (devidedStr[0] as NSString).floatValue))) + "cm"
            case("inch", "m") :
                convertedValue.text = String(describing: (convertToCM(fromInches: (devidedStr[0] as NSString).floatValue) / 100)) + "m"
            case("cm", "m") :
                convertedValue.text = String(describing: ((devidedStr[0] as NSString).floatValue / 100)) + "m"
            case("m", "cm") :
                convertedValue.text = String(describing: ((devidedStr[0] as NSString).floatValue * 100)) + "cm"
            default:
                convertedValue.text =  "Error"
            }
        }
    }
    
    func convertToInches(fromCM: Float) -> Float {
        var result: Float = 0
        result = fromCM / 2.54
        return result
    }
    func convertToCM(fromInches : Float) -> Float { //inch - > cm converter function
        var result : Float = 0
        result = fromInches * 2.54
        return result
    }
    
    
    
}

