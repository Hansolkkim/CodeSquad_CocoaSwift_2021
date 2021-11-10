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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "Password"
        descriptionLabel.text = "암호 수준"
        
    }
    let alert = UIAlertController(title: "Recommended Password", message: "Do you want Powerful Password?" , preferredStyle: .alert)
   
    
    @IBAction func checkButton(_ sender: Any) {
        let passwordString = passwordInput.text!
        let myValidator = validator()
        let mylevel = myValidator.passwordValidator(password: passwordString)
        
        switch mylevel {
        case 1 :
            levelViewLabel.backgroundColor = UIColor.red
            recommendPassword()
        case 2 :
            levelViewLabel.backgroundColor = UIColor.orange
            recommendPassword()
        case 3 :
            levelViewLabel.backgroundColor = UIColor.yellow
            recommendPassword()
        case 4 :
            levelViewLabel.backgroundColor = UIColor.blue
            recommendPassword()
        case 5 :
            levelViewLabel.backgroundColor = UIColor.green
        default :
            levelViewLabel.backgroundColor = UIColor.black
            recommendPassword()
        }
    }
    
    func randomPowerfulPassword() -> String {
        let myValidator = validator()
        var randomPassword = ""
        
        randomPassword.append(myValidator.numberCharacterset.description.randomElement()!)
        randomPassword.append(myValidator.letterCharacterset.description.randomElement()!)
        randomPassword.append(myValidator.symbolCharacterset.description.randomElement()!)
        
        while randomPassword.count <= 10 {
            let randomDigit = Int.random(in: 1...3)
            
            switch randomDigit {
            case 1 :
                randomPassword.append(myValidator.numberCharacterset.description.randomElement()!)
            case 2 :
                randomPassword.append(myValidator.letterCharacterset.description.randomElement()!)
            case 3 :
                randomPassword.append(myValidator.symbolCharacterset.description.randomElement()!)
            default :
                continue
            }
        }
        
           return randomPassword
    }
    
    func recommendPassword() {
        let yesAnswer = UIAlertAction(title: "Yes", style: .default, handler: { (action: UIAlertAction!) in print("네") } )
        let noAnswer = UIAlertAction(title: "cancle", style: .cancel, handler: nil)
        
        alert.addAction(yesAnswer)
        alert.addAction(noAnswer)
        
        present(alert, animated: true, completion: nil)
    }
    
    func typingInTextField () {
        let powerfulPassword = randomPowerfulPassword()
        passwordInput.text = powerfulPassword
    }
    
}

