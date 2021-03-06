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
    var a = 0
    for i in 0..<currentYutBoard.count {
        if currentYutBoard[i].first != "  " {
            if a == 5 {
                print("                                            \(2*a)",terminator: "")
            } else {
                print("                                             \(2*a)",terminator: "")
            }
            a += 1
        }else {
            print("                                              ",terminator: "")
        }
        for j in 0..<currentYutBoard[0].count {
            print(currentYutBoard[i][j], terminator: "")
        }
        print("")
    }
    print("                                              0      3     6     9     12    15")
    print("")
}

func printGameStart() {
    print("====================================================================================================")
    print("                                       윷놀이 게임을 시작하겠습니다!")
    print("====================================================================================================")
    print("")
    print("*************************************************규칙*************************************************")
    print("1. 3개의 말이 먼저 들어오는 Player가 승리합니다.")
    print("2. 말 색깔 선택시 입력값이 정수 1~6 이외의 값이면 1P는 🟤, 2P는 ⚫️로 지정됩니다.")
    print("3. 첫번째 윷을 던질 때는 말이 자동으로 선택되고, 이후에는 Player가 선택할 수 있습니다.")
    print("4. 윷을 던지고 움직일 말을 선택할 때, (완주)에 해당하는 말을 선택하면 완주상태가 초기화됩니다.")
    print("5. 아직 말을 업는 부분은 구현하지 못했습니다.")
    print("6. 각각의 분기점에서는 Player가 안으로 들어갈지, 바깥으로 돌아갈지 선택할 수 있습니다.")
    print("7. 윷 또는 모가 나왔을 경우 최대 2번 더 윷을 던지게 되고, 나온 윷 모양의 순서의 역순으로 움직일 말을 선택할 수 있습니다.")
    print("8. 윷 또는 모가 나오고 나온 윷 모양으로 말을 움직이던 중 상대의 말을 잡게 되면, 도중에 윷을 한 번 더 던집니다.")
    print("*****************************************************************************************************")
    print("")
}

func printWinner(player : Int) {
    print("")
    print("====================================================================================================")
    print("                                           \(player)P가 승리했습니다!!")
    print("====================================================================================================")
}
