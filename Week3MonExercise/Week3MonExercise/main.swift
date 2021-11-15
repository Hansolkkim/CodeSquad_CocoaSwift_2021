//
//  main.swift
//  Week3MonExercise
//
//  Created by 김한솔 on 2021/11/15.
//

import Foundation

//연습문제 1 출력
var myMatrix = Matrix(a: 1, b: 2, c: 3, d: 4)
myMatrix.printMatrix(myMatrix)

var otherMatrix = Matrix(a: 2, b: 3, c: 4, d: 5)
otherMatrix.printMatrix(otherMatrix)

myMatrix.printMatrix(myMatrix.sum(with: otherMatrix))
myMatrix.printMatrix(myMatrix.product(with: otherMatrix))

//연습문제 2 출력
var myBinary = SpecialBinary(with: 5)
myBinary.printFound(myBinary.find(by: 4))
