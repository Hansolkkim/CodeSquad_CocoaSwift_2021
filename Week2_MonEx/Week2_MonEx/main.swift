//
//  main.swift
//  Week2_MonEx
//
//  Created by 김한솔 on 2021/11/08.
//

import Foundation

//연습문제1, 미션1 출력
var myArray = ArrayPractice()
myArray.printArray(array: myArray.fillArray())

//연습문제1, 미션2 출력
myArray.printArray(array: myArray.setBoolArray(), newChar: "$")

//연습문제1, 미션3 출력
var sizeMagicSquare = myArray.setMagicSquareSize()
myArray.printMagicSquare(input: myArray.makeMagicSquare(row: sizeMagicSquare))

//연습문제2 출력
var myValidator = Validator()
let myID = myValidator.getID()

myValidator.printIDValidator(resultIDValidation: myValidator.IDValidator(ID: myID))

//연습문제3 출력
let myPW = myValidator.getPassword()
myValidator.printPasswordValidator(input: myValidator.passwordValidator(password: myPW))

//연습문제4 출력
let mySocialNum = myValidator.getSocialNum()
myValidator.printSocialNumValidator(input: myValidator.socialNumValidator(socialNum: mySocialNum))

//연습문제5 출력
let myAntPuzzle = antPuzzle()
print(myAntPuzzle.antFunction(inputArray: [1, 1]))
