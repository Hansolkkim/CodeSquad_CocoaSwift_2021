//
//  ViewController.swift
//  guessWordApp
//
//  Created by 김한솔 on 2021/11/10.
//

import UIKit

class ViewController: UIViewController {
    let wordArray = ["동해물과","백두산이","마르고","닳도록","하느님이","보우하사","우리나라","만세","무궁화","삼천리"]
    @IBOutlet weak var currentWord: UILabel!
    @IBOutlet weak var nextWord: UILabel!
    @IBOutlet weak var typedWord: UITextField!
    @IBOutlet weak var compileButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let wordArray = wordArray.shuffled()
        compileButton.setTitle("확인", for: .normal)
        currentWord.text = wordArray[0]
        nextWord.text = wordArray[1]
        nextWord.textColor = UIColor.gray
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { //흰배경 선택시 키보드가 사라지게 함
        self.view.endEditing(true)
    }
    var index = 1 //wordArray배열 index로 사용될 변수
    let alert = UIAlertController(title: "성공!", message: "모든 단어를 맞췄습니다.", preferredStyle: .alert)
    
    @IBAction func compareWords(_ sender: Any) {
        
        
        if typedWord.text == currentWord.text {
            
            currentWord.textColor = UIColor.black
            currentWord.text = nextWord.text
            typedWord.text = "" // 맞추면 textfield 비워주기
            
            if index == 9{
                nextWord.text = " "
            } else {
                nextWord.text = wordArray[index+1]
                index += 1
            }
            if currentWord.text == " " {
                alert.addAction(UIAlertAction(title: "성공!", style: .destructive, handler: nil))
                self.present(alert, animated: true)
            }
        } else {
            typedWord.text = ""
            currentWord.textColor = UIColor.red
        }
        
    }
    
    
}


