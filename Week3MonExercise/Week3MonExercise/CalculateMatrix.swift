//
//  CalculateMatrix.swift
//  Week3MonExercise
//
//  Created by 김한솔 on 2021/11/15.
//

import Foundation

class Matrix {
    var a : Double = 0
    var b : Double = 0
    var c : Double = 0
    var d : Double = 0
    
    init(a: Double, b: Double, c: Double, d:Double) {
        self.a = a
        self.b = b
        self.c = c
        self.d = d
    }
    
    func sum (with other: Matrix) -> Matrix {
        print("덧셈 결과")
        return Matrix(a: self.a + other.a, b: self.b + other.b, c: self.c + other.c, d: self.d + other.d)
    }
      
    func product (with other: Matrix) -> Matrix {
        print("곱셈 결과")
        return Matrix(a: self.a * other.a + self.b * other.c,
                      b: self.a * other.b + self.b * other.d,
                      c: self.c * other.a + self.d * other.c,
                      d: self.c * other.b + self.d * other.d)
    }
    
    
    
    func printMatrix(_ matrix: Matrix) {
        print("\(matrix.a) \(matrix.b)")
        print("\(matrix.c) \(matrix.d)")
        print(" ")
    }
}

