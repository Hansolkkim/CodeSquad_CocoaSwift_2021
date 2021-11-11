//
//  ViewController.swift
//  enterPasswordApp
//
//  Created by 김한솔 on 2021/11/10.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var levelViewLabel: UILabel!
    @IBOutlet weak var labelTitleLabel: UILabel!
    @IBOutlet weak var recommnededPassword: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemIndigo
        titleLabel.text = "Password"
        descriptionLabel.text = "암호 수준"
        labelTitleLabel.text = "추천 암호 :"
        recommnededPassword.text = " "
        passwordInput.addTarget(self, action: #selector(checkTypedIn(textField:)), for: .editingChanged)
        
    }
    
    @IBAction func checkButton(_ sender: Any) {
        
        let passwordString = passwordInput.text!
        let myValidator = validator()
        let myLevel = myValidator.passwordValidator(password: passwordString)
        let (myLevelColor, myDescription) = myValidator.setLevelElement(level: myLevel)
        levelViewLabel.backgroundColor = myLevelColor
        descriptionLabel.text = myDescription
        if myLevel < 5 {
            recommnededPassword.text = myValidator.randomPowerfulPassword()
        } else {
            recommnededPassword.text = " "
        }
    }
    
    @objc func checkTypedIn(textField: UITextField) {
        
        let passwordString = self.passwordInput.text!
        let myValidator = validator()
        let myLevel = myValidator.passwordValidator(password: passwordString)
        let (myLevelColor, myDescription) = myValidator.setLevelElement(level: myLevel)
        levelViewLabel.backgroundColor = myLevelColor
        descriptionLabel.text = myDescription
        if myLevel < 6 {
            recommnededPassword.text = myValidator.randomPowerfulPassword()
        } else {
            recommnededPassword.text = " "
        }
    }
    
}

