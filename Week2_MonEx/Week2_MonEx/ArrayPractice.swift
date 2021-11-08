//
//  ArrayPractice.swift
//  Week2_MonEx
//
//  Created by 김한솔 on 2021/11/08.
//

import Foundation

/* 연습문제1. - 배열*/

//미션1. 2차원 배열 만들기 & 출력하기

struct ArrayPractice {
    
    func fillArray() -> [[Int]] {
        var Array2D: [[Int]] = [[Int]]()
        Array2D.append([1])
        Array2D.append([6,7])
        Array2D.append([11,12,13])
        Array2D.append([16,17,18,19])
        Array2D.append([21,22,23,24,25])
        
        return Array2D
    }
    
    func printArray(array: [[Int]]){
        for i in array{
            print(i)
        }
    }
    
    //미션2. setBoolArray와 printArray
    func setBoolArray() -> Array<Array<Bool>> {
        print("배열의 크기를 입력하세요 : ", terminator: "" )
        let sizeOfArray = Int(readLine()!)!
        
        var BoolArray: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: sizeOfArray), count: sizeOfArray)
        
        for rows in 0..<sizeOfArray {
            var locationTrue = 0
            while rows - locationTrue >= 0 {
                BoolArray[rows][BoolArray[rows].index(BoolArray[rows].endIndex, offsetBy: -locationTrue-1)] = true
                locationTrue += 1
            }
            
        }
        return BoolArray
    }

    func printArray(array: Array<Array<Bool>>, newChar:Character) {
        var arrayForPrinting: [[Character]] = [[Character]](repeating: [Character](repeating: " ", count: array[0].count), count: array.count)
        for rows in 0..<array[0].count {
            for columns in 0..<array.count {
                if array[rows][columns] == true {
                    arrayForPrinting[rows][columns] = newChar
                }
            }
        print(arrayForPrinting[rows])
        }
    }
    
    //미션3. 마방진
    var magicSquareSize: Int = 0
    mutating func setMagicSquareSize() -> Int {
        print("마방진의 크기를 입력하세요 : ", terminator: "")
        let size = Int(readLine()!)!
        magicSquareSize = size
        return size
    }
    
    func makeMagicSquare(row: Int) -> Array<Array<Int>> {
        var magicSquare: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: row), count: row)
        var numToPutIn = 1
        var myRow = 0, myColumn: Int = row/2
        magicSquare[0][row/2] = numToPutIn
        
        while numToPutIn < row*row {
            numToPutIn += 1
            var nextRow = myRow - 1, nextColumn = myColumn + 1
            if nextRow < 0 {
                nextRow = row - 1
            }
            if nextColumn > row - 1 {
                nextColumn = 0
            }
        
            if magicSquare[nextRow][nextColumn] == 0 {
                magicSquare[nextRow][nextColumn] = numToPutIn
            } else {
                nextRow = myRow + 1
                if nextRow > row - 1 {
                    nextRow = 0
                }
                nextColumn = myColumn
                magicSquare[nextRow][nextColumn] = numToPutIn
            }
            myRow = nextRow; myColumn = nextColumn
        }
        return magicSquare
    }

    func printMagicSquare(input: Array<Array<Int>>) {
        if magicSquareSize % 2 != 0 {
            for i in 0..<magicSquareSize {
                print(input[i])
            }
        } else {
            print("홀수 size의 마방진만 구현했습니다.")
        }
        
    }
}
