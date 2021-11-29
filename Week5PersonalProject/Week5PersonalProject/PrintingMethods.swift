//
//  PrintingMethods.swift
//  Week5PersonalProject
//
//  Created by 김한솔 on 2021/11/29.
//

import Foundation

func printYut(_ a: Int,_ b: Int,_ c: Int,_ d: Int) { //나온 윷 모양을 출력하는 메소드
    switch (a,b,c,d) {
    case (1,0,0,0):
        print("⎧‾‾⎫⎧‾‾⎫⎧‾‾⎫⎧‾‾⎫")
        print("⎪  ⎪⎪x ⎪⎪x ⎪⎪x ⎪")
        print("⎪  ⎪⎪x ⎪⎪x ⎪⎪x ⎪")
        print("⎪  ⎪⎪x ⎪⎪x ⎪⎪x ⎪")
        print("⎪  ⎪⎪x ⎪⎪x ⎪⎪x ⎪")
        print("⎩__⎭⎩__⎭⎩__⎭⎩__⎭")
    case (0,1,0,0):
        print("⎧‾‾⎫⎧‾‾⎫⎧‾‾⎫⎧‾‾⎫")
        print("⎪x ⎪⎪  ⎪⎪x ⎪⎪x ⎪")
        print("⎪x ⎪⎪  ⎪⎪x ⎪⎪x ⎪")
        print("⎪x ⎪⎪  ⎪⎪x ⎪⎪x ⎪")
        print("⎪x ⎪⎪  ⎪⎪x ⎪⎪x ⎪")
        print("⎩__⎭⎩__⎭⎩__⎭⎩__⎭")
    case (0,0,1,0):
        print("⎧‾‾⎫⎧‾‾⎫⎧‾‾⎫⎧‾‾⎫")
        print("⎪x ⎪⎪x ⎪⎪  ⎪⎪x ⎪")
        print("⎪x ⎪⎪x ⎪⎪  ⎪⎪x ⎪")
        print("⎪x ⎪⎪x ⎪⎪  ⎪⎪x ⎪")
        print("⎪x ⎪⎪x ⎪⎪  ⎪⎪x ⎪")
        print("⎩__⎭⎩__⎭⎩__⎭⎩__⎭")
    case (0,0,0,1):
        print("⎧‾‾⎫⎧‾‾⎫⎧‾‾⎫⎧‾‾⎫")
        print("⎪x ⎪⎪x ⎪⎪x ⎪⎪b ⎪")
        print("⎪x ⎪⎪x ⎪⎪x ⎪⎪a ⎪")
        print("⎪x ⎪⎪x ⎪⎪x ⎪⎪c ⎪")
        print("⎪x ⎪⎪x ⎪⎪x ⎪⎪k ⎪")
        print("⎩__⎭⎩__⎭⎩__⎭⎩__⎭")
    case (1,1,0,0):
        print("⎧‾‾⎫⎧‾‾⎫⎧‾‾⎫⎧‾‾⎫")
        print("⎪  ⎪⎪  ⎪⎪x ⎪⎪x ⎪")
        print("⎪  ⎪⎪  ⎪⎪x ⎪⎪x ⎪")
        print("⎪  ⎪⎪  ⎪⎪x ⎪⎪x ⎪")
        print("⎪  ⎪⎪  ⎪⎪x ⎪⎪x ⎪")
        print("⎩__⎭⎩__⎭⎩__⎭⎩__⎭")
    case (1,0,1,0):
        print("⎧‾‾⎫⎧‾‾⎫⎧‾‾⎫⎧‾‾⎫")
        print("⎪  ⎪⎪x ⎪⎪  ⎪⎪x ⎪")
        print("⎪  ⎪⎪x ⎪⎪  ⎪⎪x ⎪")
        print("⎪  ⎪⎪x ⎪⎪  ⎪⎪x ⎪")
        print("⎪  ⎪⎪x ⎪⎪  ⎪⎪x ⎪")
        print("⎩__⎭⎩__⎭⎩__⎭⎩__⎭")
    case (1,0,0,1):
        print("⎧‾‾⎫⎧‾‾⎫⎧‾‾⎫⎧‾‾⎫")
        print("⎪  ⎪⎪x ⎪⎪x ⎪⎪  ⎪")
        print("⎪  ⎪⎪x ⎪⎪x ⎪⎪  ⎪")
        print("⎪  ⎪⎪x ⎪⎪x ⎪⎪  ⎪")
        print("⎪  ⎪⎪x ⎪⎪x ⎪⎪  ⎪")
        print("⎩__⎭⎩__⎭⎩__⎭⎩__⎭")
    case (0,1,1,0):
        print("⎧‾‾⎫⎧‾‾⎫⎧‾‾⎫⎧‾‾⎫")
        print("⎪x ⎪⎪  ⎪⎪  ⎪⎪x ⎪")
        print("⎪x ⎪⎪  ⎪⎪  ⎪⎪x ⎪")
        print("⎪x ⎪⎪  ⎪⎪  ⎪⎪x ⎪")
        print("⎪x ⎪⎪  ⎪⎪  ⎪⎪x ⎪")
        print("⎩__⎭⎩__⎭⎩__⎭⎩__⎭")
    case (0,1,0,1):
        print("⎧‾‾⎫⎧‾‾⎫⎧‾‾⎫⎧‾‾⎫")
        print("⎪x ⎪⎪  ⎪⎪x ⎪⎪  ⎪")
        print("⎪x ⎪⎪  ⎪⎪x ⎪⎪  ⎪")
        print("⎪x ⎪⎪  ⎪⎪x ⎪⎪  ⎪")
        print("⎪x ⎪⎪  ⎪⎪x ⎪⎪  ⎪")
        print("⎩__⎭⎩__⎭⎩__⎭⎩__⎭")
    case (0,0,1,1):
        print("⎧‾‾⎫⎧‾‾⎫⎧‾‾⎫⎧‾‾⎫")
        print("⎪x ⎪⎪x ⎪⎪  ⎪⎪  ⎪")
        print("⎪x ⎪⎪x ⎪⎪  ⎪⎪  ⎪")
        print("⎪x ⎪⎪x ⎪⎪  ⎪⎪  ⎪")
        print("⎪x ⎪⎪x ⎪⎪  ⎪⎪  ⎪")
        print("⎩__⎭⎩__⎭⎩__⎭⎩__⎭")
    case (1,1,1,0):
        print("⎧‾‾⎫⎧‾‾⎫⎧‾‾⎫⎧‾‾⎫")
        print("⎪  ⎪⎪  ⎪⎪  ⎪⎪x ⎪")
        print("⎪  ⎪⎪  ⎪⎪  ⎪⎪x ⎪")
        print("⎪  ⎪⎪  ⎪⎪  ⎪⎪x ⎪")
        print("⎪  ⎪⎪  ⎪⎪  ⎪⎪x ⎪")
        print("⎩__⎭⎩__⎭⎩__⎭⎩__⎭")
    case (1,1,0,1):
        print("⎧‾‾⎫⎧‾‾⎫⎧‾‾⎫⎧‾‾⎫")
        print("⎪  ⎪⎪  ⎪⎪x ⎪⎪  ⎪")
        print("⎪  ⎪⎪  ⎪⎪x ⎪⎪  ⎪")
        print("⎪  ⎪⎪  ⎪⎪x ⎪⎪  ⎪")
        print("⎪  ⎪⎪  ⎪⎪x ⎪⎪  ⎪")
        print("⎩__⎭⎩__⎭⎩__⎭⎩__⎭")
    case (1,0,1,1):
        print("⎧‾‾⎫⎧‾‾⎫⎧‾‾⎫⎧‾‾⎫")
        print("⎪  ⎪⎪x ⎪⎪  ⎪⎪  ⎪")
        print("⎪  ⎪⎪x ⎪⎪  ⎪⎪  ⎪")
        print("⎪  ⎪⎪x ⎪⎪  ⎪⎪  ⎪")
        print("⎪  ⎪⎪x ⎪⎪  ⎪⎪  ⎪")
        print("⎩__⎭⎩__⎭⎩__⎭⎩__⎭")
    case (0,1,1,1):
        print("⎧‾‾⎫⎧‾‾⎫⎧‾‾⎫⎧‾‾⎫")
        print("⎪x ⎪⎪  ⎪⎪  ⎪⎪  ⎪")
        print("⎪x ⎪⎪  ⎪⎪  ⎪⎪  ⎪")
        print("⎪x ⎪⎪  ⎪⎪  ⎪⎪  ⎪")
        print("⎪x ⎪⎪  ⎪⎪  ⎪⎪  ⎪")
        print("⎩__⎭⎩__⎭⎩__⎭⎩__⎭")
    case (1,1,1,1):
        print("⎧‾‾⎫⎧‾‾⎫⎧‾‾⎫⎧‾‾⎫")
        print("⎪  ⎪⎪  ⎪⎪  ⎪⎪  ⎪")
        print("⎪  ⎪⎪  ⎪⎪  ⎪⎪  ⎪")
        print("⎪  ⎪⎪  ⎪⎪  ⎪⎪  ⎪")
        print("⎪  ⎪⎪  ⎪⎪  ⎪⎪  ⎪")
        print("⎩__⎭⎩__⎭⎩__⎭⎩__⎭")
    case (0,0,0,0):
        print("⎧‾‾⎫⎧‾‾⎫⎧‾‾⎫⎧‾‾⎫")
        print("⎪x ⎪⎪x ⎪⎪x ⎪⎪x ⎪")
        print("⎪x ⎪⎪x ⎪⎪x ⎪⎪x ⎪")
        print("⎪x ⎪⎪x ⎪⎪x ⎪⎪x ⎪")
        print("⎪x ⎪⎪x ⎪⎪x ⎪⎪x ⎪")
        print("⎩__⎭⎩__⎭⎩__⎭⎩__⎭")
    default: return
    }
}

func printYutBoard(_ currentYutBoard: [[String]]) {
    for i in 0..<currentYutBoard.count {
        for j in 0..<currentYutBoard[0].count {
            print(currentYutBoard[i][j], terminator: "")
        }
        print("")
    }
}
