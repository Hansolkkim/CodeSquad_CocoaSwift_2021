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
        
        for row in 0...4 {
            
            var arrayPerRow = [Int]()
            for column in 0...4 {
                
                if column <= row { //1행은 1개, 2행은 2개...의 값만을 가지도록 조건문 사용
                    
                    arrayPerRow.append(5 * row + column + 1)
                }
            }
            
            Array2D.append(arrayPerRow)
        }
        
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
        //정n각형이 아닌 경우네에는 우측 정렬된 삼각형이란 의미가 애매해졌기 때문에 정n각형의 배열만 다뤘음.
        for rows in 0..<sizeOfArray {
            
            var truePosition = 0 //true가 들어가는 위치 (-를 붙여서 endIndex에서 -truePosition만큼 떨어진 위치를 나타냄)
            
            while rows - truePosition >= 0 { //1행에선 하나, 2행에선 둘, 3행에선 세개...의 true를 가짐
                
                BoolArray[rows][BoolArray[rows].index(BoolArray[rows].endIndex, offsetBy: -truePosition-1)] = true
                truePosition += 1
                
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
        print("마방진의 크기를 입력하세요(홀수) : ", terminator: "")
        let size = Int(readLine()!)!
        magicSquareSize = size
        return size
    }
    
    func makeMagicSquare(row: Int) -> Array<Array<Int>> {
        var magicSquare: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: row), count: row)
        var numToPutIn = 1
        var myRow = 0, myColumn: Int = row/2
        
        magicSquare[0][row/2] = numToPutIn //마방진의 제일 위 행의 가운데 열에 1을 입력
        
        while numToPutIn < row*row { //정n각형의 마방진에서 가장 큰 수는 n^2
            
            numToPutIn += 1
            var nextRow = myRow - 1, nextColumn = myColumn + 1 //오른쪽 위로 이동하면서 numToPutIn을 대입
            
            if nextRow < 0 { //0행에서 위로 올라갔을 때
                
                nextRow = row - 1 //제일 아래로 이동((row-1)행으로)
            }
            
            if nextColumn > row - 1 { //오른쪽 끝에서 오른쪽으로 갔을 때
                
                nextColumn = 0 //제일 왼쪽으로 이동(0열으로)
            }
        
            if magicSquare[nextRow][nextColumn] == 0 { //이동할 자리가 비었을 경우
                
                magicSquare[nextRow][nextColumn] = numToPutIn
            } else { //이동할 자리가 안비었으면 원래의 자리의 바로 아래에 값 대입
                
                nextRow = myRow + 1
//                if nextRow > row - 1 { //마지막 행에서 아래로 이동할 경우
//
//                    nextRow = 0
//                }
                nextColumn = myColumn
                magicSquare[nextRow][nextColumn] = numToPutIn
            }
            myRow = nextRow; myColumn = nextColumn
        }
        return magicSquare
    }

    func printMagicSquare(input: Array<Array<Int>>) {
        if magicSquareSize % 2 != 0 { //홀수 마방진만 구현하여, 홀수에서만 출력하도록 함
            for i in 0..<magicSquareSize {
                print(input[i])
            }
        } else {
            print("홀수 size의 마방진만 구현했습니다.")
        }
        
    }
}
