//
//  ViewController.swift
//  Week3WedCalculatorApp
//
//  Created by 김한솔 on 2021/11/17.
//

import UIKit

class ViewController: UIViewController {
    var isInputStarted = false
    var prevOperator = [String]()
    var stacks = [Double]()
    var stackPointer = 0
    @IBOutlet weak var calResultLabel: UILabel!
    @IBOutlet weak var stack1: UILabel!
    @IBOutlet weak var stack2: UILabel!
    @IBOutlet weak var stack3: UILabel!
    @IBOutlet weak var stack4: UILabel!
    @IBOutlet weak var stack5: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        calResultLabel.text = "0"
//        stack1.text = "stack1"
//        stack2.text = "stack2"
//        stack3.text = "stack3"
//        stack4.text = "stack4"
//        stack5.text = "stack5"
        
    }
    @IBAction func pressNumberButton(_ sender: UIButton) {
        
        guard let inputNum = sender.titleLabel?.text else {
            return
        }
        if calResultLabel.text!.count > 18 {
            print("소숫점 포함 18자리까지만 입력 가능합니다.")
            return
        }
        if inputNum == "." && calResultLabel.text!.contains("."){
            print(". 은 한 번만 입력 가능합니다.")
            return
        }
        
        if isInputStarted {
            calResultLabel.text! += inputNum
        } else {
            if inputNum == "." {
                calResultLabel.text! += inputNum
            }else { calResultLabel.text! = inputNum }
            isInputStarted = true
        }
        
    }
    @IBAction func pressOperatorButton(_ sender: UIButton) {
        
        guard let inputOperator = sender.titleLabel?.text else {
            return
        }
        guard let inputVal = Double(calResultLabel.text!) else {
            return
        }
        
        
        switch inputOperator {
        case "=":
            if prevOperator.isEmpty {
                print("연산자가 하나도 없이는 \"=\"를 누르면 안됩니다.")
                return
            } else {
                stacks.append(inputVal)
                (stacks, prevOperator) = cal(stacks, prevOperator)
                reloadStacks(stacks)
                if stackPointer < 5 {
                    stackPointer += 1
                } else {print("stack에 최대 5개의 값만 저장할 수 있습니다..")}
            }
        case "x" :
            stacks.append(inputVal)
            if prevOperator.isEmpty {
                prevOperator.append("*")
                reloadStacks(stacks)
            } else {
                prevOperator.append("*")
                (stacks, prevOperator) = cal(stacks, prevOperator)
                reloadStacks(stacks)
            }
            
        case "÷" :
            stacks.append(inputVal)
            if prevOperator.isEmpty {
                prevOperator.append("/")
                reloadStacks(stacks)
            } else {
                prevOperator.append("/")
                (stacks, prevOperator) = cal(stacks, prevOperator)
                reloadStacks(stacks)
            }
        default :
            stacks.append(inputVal)
            if prevOperator.isEmpty {
                prevOperator.append(inputOperator)
                reloadStacks(stacks)
            } else {
                prevOperator.append(inputOperator)
                (stacks, prevOperator) = cal(stacks, prevOperator)
                reloadStacks(stacks)
            }
        }
        
        
        
        calResultLabel.text = "0"
        isInputStarted = false
    }
    func cal(_ stacks: [Double], _ operators: [String]) -> ([Double], [String]) {
        var stacks = stacks, operators = operators
        switch operators.removeFirst() {
        case "+":
            stacks[stackPointer] =
                stacks[stackPointer] + stacks.removeLast()
        case "-":
            stacks[stackPointer] =
                stacks[stackPointer] - stacks.removeLast()
        case "/":
            stacks[stackPointer] =
                stacks[stackPointer] / stacks.removeLast()
        case "*":
            stacks[stackPointer] =
                stacks[stackPointer] * stacks.removeLast()
        default: stacks[stackPointer] = stacks[stackPointer]
        }
        return (stacks, operators)
    }
    func reloadStacks(_ input: [Double]) {
        stack1.text = String(input[0])
        if input.count > 1 {
            stack2.text = String(input[1])
            if input.count > 2 {
                stack3.text = String(input[2])
                if input.count > 3 {
                    stack4.text = String(input[3])
                    if input.count > 4 {
                        stack5.text = String(input[4])
                    }
                }
            }
        }
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            stacks = [Double]()
            stack1.text = ""
            stack2.text = ""
            stack3.text = ""
            stack4.text = ""
            calResultLabel.text = "0"
            prevOperator = [String]()
            stackPointer = 0
            isInputStarted = false
        }
    }

}

