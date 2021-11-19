//
//  customBtn.swift
//  Week3WedCalculatorApp
//
//  Created by 김한솔 on 2021/11/18.
//

import UIKit

class RoundButton: UIButton {

    override func draw(_ rect: CGRect) {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.size.height / 2
    }
    
    
}
