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



