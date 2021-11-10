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
        
        titleLabel.text = "Password"
        descriptionLabel.text = "암호 수준"
        labelTitleLabel.text = "추천 암호 :"
        recommnededPassword.text = " "
        passwordInput.addTarget(self, action: #selector(checkTypedIn(textField:)), for: .editingChanged)
        
    }
    
    @IBAction func checkButton(_ sender: Any) {
        
        let passwordString = passwordInput.text!
        let myValidator = validator()
        let mylevel = myValidator.passwordValidator(password: passwordString)
        
        switch mylevel {
        case 1 :
            levelViewLabel.backgroundColor = UIColor.red
            recommnededPassword.text = randomPowerfulPassword()
            descriptionLabel.text = "아주 약한 암호"
        case 2 :
            levelViewLabel.backgroundColor = UIColor.orange
            recommnededPassword.text = randomPowerfulPassword()
            descriptionLabel.text = "약한 암호"
        case 3 :
            levelViewLabel.backgroundColor = UIColor.yellow
            recommnededPassword.text = randomPowerfulPassword()
            descriptionLabel.text = "보통 암호"
        case 4 :
            levelViewLabel.backgroundColor = UIColor.blue
            recommnededPassword.text = randomPowerfulPassword()
            descriptionLabel.text = "강한 암호"
        case 5 :
            levelViewLabel.backgroundColor = UIColor.green
            recommnededPassword.text = " "
            descriptionLabel.text = "아주 강한 암호"
        default :
            levelViewLabel.backgroundColor = UIColor.black
            recommnededPassword.text = " "
        }
    }
    
    @objc func checkTypedIn(textField: UITextField) {
        let passwordString = self.passwordInput.text!
        let myValidator = validator()
        let mylevel = myValidator.passwordValidator(password: passwordString)
        
        switch mylevel {
        case 1 :
            levelViewLabel.backgroundColor = UIColor.red
            recommnededPassword.text = randomPowerfulPassword()
            descriptionLabel.text = "아주 약한 암호"
        case 2 :
            levelViewLabel.backgroundColor = UIColor.orange
            recommnededPassword.text = randomPowerfulPassword()
            descriptionLabel.text = "약한 암호"
        case 3 :
            levelViewLabel.backgroundColor = UIColor.yellow
            recommnededPassword.text = randomPowerfulPassword()
            descriptionLabel.text = "보통 암호"
        case 4 :
            levelViewLabel.backgroundColor = UIColor.blue
            recommnededPassword.text = randomPowerfulPassword()
            descriptionLabel.text = "강한 암호"
        case 5 :
            levelViewLabel.backgroundColor = UIColor.green
            recommnededPassword.text = " "
            descriptionLabel.text = "아주 강한 암호"
        default :
            levelViewLabel.backgroundColor = UIColor.black
            recommnededPassword.text = " "
        }
    }
    func randomPowerfulPassword() -> String {
        let wholeLetterArray = ["a","b",
                                "c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
        let specialCharacterArray = ["-","+","!","@","#","$","%"]
        var randomPassword = ""
        
        randomPassword.append(String(Int.random(in: 0...9)))
        randomPassword.append(wholeLetterArray[Int.random(in: 0...51)])
        randomPassword.append(specialCharacterArray[Int.random(in: 0...6)])
        
        while randomPassword.count <= 10 {
            let randomDigit = Int.random(in: 1...3)
            
            switch randomDigit {
            case 1 :
                randomPassword.append(String(Int.random(in: 0...9)))
            case 2 :
                randomPassword.append(wholeLetterArray[Int.random(in: 0...51)])
            case 3 :
                randomPassword.append(specialCharacterArray[Int.random(in: 0...6)])
            default :
                continue
            }
        }
        
           return randomPassword
    }
    
}

