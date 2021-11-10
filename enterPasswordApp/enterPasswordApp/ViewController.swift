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
    @IBAction func checkButton(_ sender: Any) {
        let passwordString = passwordInput.text!
        
        let myValidator = validator()
        let mylevel = myValidator.passwordValidator(password: passwordString)
        
        switch mylevel {
        case 1 :
            levelViewLabel.backgroundColor = UIColor.red
        case 2 :
            levelViewLabel.backgroundColor = UIColor.orange
        case 3 :
            levelViewLabel.backgroundColor = UIColor.yellow
        case 4 :
            levelViewLabel.backgroundColor = UIColor.blue
        case 5 :
            levelViewLabel.backgroundColor = UIColor.green
        default :
            levelViewLabel.backgroundColor = UIColor.black
        }
    }
    
    
}

