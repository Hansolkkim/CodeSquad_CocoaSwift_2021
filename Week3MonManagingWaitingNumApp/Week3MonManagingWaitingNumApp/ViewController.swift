//
//  ViewController.swift
//  Week3MonManagingWaitingNumApp
//
//  Created by 김한솔 on 2021/11/15.
//

import UIKit

class ViewController: UIViewController {
    var waitingNum: Int = 0
    @IBOutlet weak var waitingNumbers: UILabel!
    @IBOutlet weak var waitingButton: UIButton!
    @IBOutlet weak var completeButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        waitingNumbers.text = "00"
        waitingNumbers.textColor = UIColor.black
        progressBar.progressViewStyle = .default
        progressBar.progressTintColor = .systemBlue
        progressBar.progress = 0
       
    }
    @IBAction func plusWaitingNum(_ sender: Any) {
        waitingNum += 1
        completeButton.isEnabled = true
        if waitingNum < 10 {
            waitingNumbers.text = "0" + String(waitingNum)
            progressBar.progress += 0.05
        } else if waitingNum <= 20 {
            waitingNumbers.text = String(waitingNum)
            progressBar.progress += 0.05
        }
        if waitingNum >= 20 {
            waitingNumbers.textColor = UIColor.systemRed
            waitingButton.isEnabled = false
            progressBar.progressTintColor = .systemRed
        }

    }
    
    @IBAction func minusWaitingNum(_ sender: Any) {
        waitingNum -= 1
        waitingButton.isEnabled = true
        progressBar.progressTintColor = .systemBlue
        if waitingNum < 10 && waitingNum >= 0 {
            waitingNumbers.text = "0" + String(waitingNum)
            waitingNumbers.textColor = UIColor.black
            progressBar.progress -= 0.05
        } else {
            waitingNumbers.text = String(waitingNum)
            waitingNumbers.textColor = UIColor.black
            progressBar.progress -= 0.05
        }
        if waitingNum <= 0 {
            completeButton.isEnabled = false
        }
    }
    

}

