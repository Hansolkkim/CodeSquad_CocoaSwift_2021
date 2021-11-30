//
//  YutPlay.swift
//  Week5PersonalProject
//
//  Created by 김한솔 on 2021/11/29.
//

import Foundation
struct Position { //말의 위치를 나타내기 위한 struct
    var (y,x) : (Int,Int)
}

struct YutPlay {
    let yutBoard:[[String]] =  [["⚪️","  ","  ","⚪️","  ","  ","⚪️","  ","  ","⚪️","  ","  ","⚪️","  ","  ","⚪️"],
                                ["  ","ﾠ  ","  ","  ","  ","ﾠ  ","  ","ﾠ  ","  ","  ","  ","  ","  ","  ","  ","  "],
                                ["⚪️","ﾠ  ","  ","⚪️","  ","  ","  ","  ","ﾠ  ","  ","ﾠ  ","  ","⚪️","  ","  ","⚪️"],
                                ["  ","ﾠ  ","  ","  ","  ","ﾠ  ","  ","ﾠ  ","  ","  ","  ","  ","  ","  ","  ","  "],
                                ["⚪️","ﾠ  ","ﾠ  ","  ","ﾠ  ","  ","⚪️","ﾠ  ","ﾠ  ","⚪️","ﾠ  ","  ","ﾠ  ","ﾠ  ","  ","⚪️"],
                                ["  ","ﾠ  ","ﾠ  ","ﾠ  ","ﾠ  ","  ","  "," ","ﾠ⚪️","  ","ﾠ  ","ﾠ  ","ﾠ  ","  ","  ","  "],
                                ["⚪️","ﾠ  ","ﾠ  ","ﾠ  ","  ","  ","⚪️","ﾠ  ","ﾠ  ","⚪️","ﾠ  ","ﾠ  ","ﾠ  ","  ","  ","⚪️"],
                                ["  ","  ","  ","ﾠ  ","  ","ﾠ  ","ﾠ  ","ﾠ  ","ﾠ  ","ﾠ  ","ﾠ  ","  ","  ","  ","  ","  "],
                                ["⚪️","  ","ﾠ  ","⚪️","  ","  ","  ","ﾠ  ","ﾠ  ","ﾠ  ","  ","  ","⚪️","ﾠ  ","  ","⚪️"],
                                ["  ","ﾠ  ","  ","  ","  ","ﾠ  ","ﾠ  ","ﾠ  ","ﾠ  ","ﾠ  ","ﾠ  ","  ","ﾠ  ","  ","  ","  "],
                                ["⚪️","  ","ﾠ  ","⚪️","  ","ﾠ  ","⚪️","  ","ﾠ  ","⚪️","  ","ﾠ  ","⚪️","  ","ﾠ  ","⚪️"]]
    var firstPlayerCurrentPosition = [Position(y:-1,x:-1)]
    var secondPlayerCurrentPosition = [Position(y:-1,x:-1)]
    var isFirstPlayerGallIn:[Bool] = []
    var isSecondPlayerGallIn:[Bool] = []
    var firstPlayerMal: String = "🟤"
    var secondPlayerMal: String = "⚫️"
    var whosFirst: Int = 0 // 누가 먼저 시작하는지 저장해놓는 변수
    var whosLast: Int = 0 // while문이 돌면서 마지막으로 던진 사람이 계속 변할 수 있기 때문에, while문 반복 한 번이 끝날때마다 누가 마지막으로 던졌는지를 저장해주는 변수
    var isFromFirstIntersection: [Int] = [0,0] // 첫번째 분기점에서 한 가운데 지점으로 갈 경우에만 선택지를 2개(오른쪽으로, 왼쪽으로) 가질 수 있으므로 flag bit 사용
    var isComingBack: [Bool] = [false, false] // YutBoard의 y=10, x=15 지점에 말이 온 경우, isRight()함수 호출시 말이 윷판의 오른쪽에 있다고 인식되므로 다시 출발하는 말로 인식이 됨.
    // 만약 한바퀴를 돌거나, 도->빽도->빽도의 경우에는 그 말에 해당하는 isComingBack의 값을 true로 해주어, 이 말은 골인하는 중이라는 것을 표시해주는 변수
    var stackedYut: [[String]] = [[],[]] //윷,모가 나올 경우 한 번 더 던질 수 있으므로, 2P의 나왔던 윷 모양을 저장해놓는 변수
    var isGetYutOrMo: [Bool] = [false, false] // 윷,모가 나왔다는걸 알려주기 위한 변수
    mutating func setMalColor() {
        print("윷놀이 게임 시작!")
        //        print("3개의 말이 먼저 들어오는 사람이 승리합니다.")
        print("1P의 말의 색깔을 선택하세요.")
        print("1 : 🔴, 2 : 🟠, 3 : 🟡, 4 : 🟢, 5 : 🔵, 6 : 🟣")
        
        guard let input1 = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!) else {
            print("입력값이 옳지않습니다.")
            print("Player의 말은 랜덤으로 지정 됩니다.")
            print("1P의 말은 🟤 입니다.")
            print("2P의 말은 ⚫️ 입니다.")
            firstPlayerMal = "🟤"
            secondPlayerMal = "⚫️"
            whosFirst = Int.random(in: 1...2)
            printYutBoard(yutBoard)
            print("                                                                    시작 위치는 ↑ 여기입니다.")
            return
        }
        firstPlayerMal = selectMalColor(input: input1, player: 1)
        
        print("")
        print("2P의 말의 색깔을 선택하세요.")
        print("1 : 🔴, 2 : 🟠, 3 : 🟡, 4 : 🟢, 5 : 🔵, 6 : 🟣")
        
        guard let input2 = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!) else {
            print("입력값이 옳지않습니다.")
            print("2P의 말은 랜덤으로 지정 됩니다.")
            print("2P의 말은 ⚫️ 입니다.")
            secondPlayerMal = "⚫️"
            whosFirst = Int.random(in: 1...2)
            printYutBoard(yutBoard)
            print("                                                                    시작 위치는 ↑ 여기입니다.")
            return
        }
        secondPlayerMal = selectMalColor(input: input2, player: 2)
        
        printYutBoard(yutBoard)
        print("                                                                    시작 위치는 ↑ 여기입니다.")
        whosFirst = Int.random(in: 1...2)
        func selectMalColor(input : Int, player : Int) -> String {
            
            switch input {
            case 1 :
                print("\(player)P의 말은 🔴 입니다.")
                return "🔴"
            case 2 :
                print("\(player)P의 말은 🟠 입니다.")
                return "🟠"
            case 3 :
                print("\(player)P의 말은 🟡 입니다.")
                return "🟡"
            case 4 :
                print("\(player)P의 말은 🟢 입니다.")
                return "🟢"
            case 5 :
                print("\(player)P의 말은 🔵 입니다.")
                return "🔵"
            case 6 :
                print("\(player)P의 말은 🟣 입니다.")
                return "🟣"
            default:
                print("입력값이 1~6 이외의 값이므로 말이 랜덤으로 선택됩니다.")
                print("\(player)P의 말은 🟤 입니다.")
                return "🟤"
            }
        }
    }
    
    mutating func startGame() { //중심 메소드
        setMalColor()
        print("시작 Player는 랜덤으로 정해집니다")
        print("\(self.whosFirst)P 가 먼저 시작하겠습니다!")
        var yutBoard = self.yutBoard // YutPlay struct의 yutBoard 프로퍼티는 아무런 말이 놓여지지 않은 상태로 유지해야하므로, 복사해서 사용
        if self.whosFirst == 1 {
            var currentMove = throwYut(player: 1)
            isFirstPlayerGallIn.append(false)
            self.firstPlayerCurrentPosition[0] =
            moveMal(from: firstPlayerCurrentPosition[0], by: currentMove, player: 1)
            if currentMove == -1 { //처음 던질 때부터 빽도가 나올 경우 이 Position을 yutboard에 입력해주면 index error가 발생하므로, 이 경우를 해결해주기 위한 코드
                print("출발하지 않았기 때문에 무효")
            } else {
                yutBoard[firstPlayerCurrentPosition[0].y][firstPlayerCurrentPosition[0].x] = firstPlayerMal
                printYutBoard(yutBoard)
            }
            whosLast = 1
            currentMove = throwYut(player: 2)
            isSecondPlayerGallIn.append(false)
            self.secondPlayerCurrentPosition[0] =
            moveMal(from: secondPlayerCurrentPosition[0], by: currentMove, player: 2)
            if currentMove == -1{
                print("출발하지 않았기 때문에 무효")
            } else {
                yutBoard[secondPlayerCurrentPosition[0].y][secondPlayerCurrentPosition[0].x] = secondPlayerMal
                printYutBoard(yutBoard)
            }
            whosLast = 2
        } else if self.whosFirst == 2 {
            var currentMove = throwYut(player: 2)
            isSecondPlayerGallIn.append(false)
            self.secondPlayerCurrentPosition[0] =
            moveMal(from: secondPlayerCurrentPosition[0], by: currentMove, player: 2)
            if currentMove == -1{
                print("출발하지 않았기 때문에 무효")
            } else {
                yutBoard[secondPlayerCurrentPosition[0].y][secondPlayerCurrentPosition[0].x] = secondPlayerMal
                printYutBoard(yutBoard)
            }
            whosLast = 2
            currentMove = throwYut(player: 1)
            isFirstPlayerGallIn.append(false)
            self.firstPlayerCurrentPosition[0] =
            moveMal(from: firstPlayerCurrentPosition[0], by: currentMove, player: 1)
            if currentMove == -1 { //처음 던질 때부터 빽도가 나올 경우 이 Position을 yutboard에 입력해주면 index error가 발생하므로, 이 경우를 해결해주기 위한 코드
                print("출발하지 않았기 때문에 무효")
            } else {
                yutBoard[firstPlayerCurrentPosition[0].y][firstPlayerCurrentPosition[0].x] = firstPlayerMal
                printYutBoard(yutBoard)
            }
            whosLast = 1
        }
        outer : while (isFirstPlayerGallIn.contains(false)) && (isSecondPlayerGallIn.contains(false)) {
            inner : switch whosLast { // 마지막으로 윷을 던진 Player에 따른 switch문
            case 1:
                var yutBoard = self.yutBoard
                if isCaptured(2).contains(true) { // 1P가 2P의 말을 잡았을 때 -> 1P 먼저 시작
                    let captured2PIndex = isCaptured(2).firstIndex(of: true)
                    self.secondPlayerCurrentPosition[captured2PIndex!].x = -1
                    self.secondPlayerCurrentPosition[captured2PIndex!].y = -1
                    for malNumber in 0..<secondPlayerCurrentPosition.count {
                        if secondPlayerCurrentPosition[malNumber].x != -1 {
                            yutBoard[secondPlayerCurrentPosition[malNumber].y][secondPlayerCurrentPosition[malNumber].x] = secondPlayerMal
                        }
                    }
                    print("1P가 2P의 말을 잡았으므로, 1P가 다시 윷을 던집니다.")
                    var currentMove = throwYut(player: 1)
                    var currentMal = 0
                    if firstPlayerCurrentPosition.count != 3 {
                        print("새로운 말을 움직이겠습니까? (y/n) ",terminator: "")
                        var answer = "n"
                        if let typed = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines) {
                            answer = typed
                        }
                        if answer == "y" {
                            firstPlayerCurrentPosition.append(Position(y: -1, x: -1))
                            isFirstPlayerGallIn.append(false)
                            if firstPlayerCurrentPosition.count == 1 {
                                currentMal = 1
                            } else {
                                currentMal = 2
                            }
                        } else if answer == "n" {
                            if firstPlayerCurrentPosition.count == 1 {
                                currentMal = 0
                            } else {
                                print("몇번째 말을 움직이시겠습니까? 1, 2 중에 선택해주세요 : ", terminator: "")
                                guard let choosedMal = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!) else {
                                    fatalError("Bad Input")
                                }
                                while choosedMal != 1 || choosedMal != 2 {
                                    print("1, 2 중에 선택해주세요.")
                                    guard let choosedMal = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!) else {
                                        fatalError("Bad Input")
                                    }
                                }
                                currentMal = choosedMal-1
                            }
                        }
                        
                    } else if firstPlayerCurrentPosition.count == 3 {
                        print("몇번째 말을 움직이시겠습니까? 1, 2, 3 중에 선택해주세요 : ", terminator: "")
                        guard let choosedMal = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!) else {
                            fatalError("Bad Input")
                        }
                        while choosedMal != 1 || choosedMal != 2 || choosedMal != 3{
                            print("1, 2, 3 중에 선택해주세요.")
                            guard let choosedMal = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!) else {
                                fatalError("Bad Input")
                            }
                        }
                        currentMal = choosedMal - 1
                        
                    }
                    currentMove = throwYut(player: 1)
                    self.firstPlayerCurrentPosition[currentMal] = moveMal(from: firstPlayerCurrentPosition[currentMal], by: currentMove, player: 1)
                    if !isFirstPlayerGallIn.contains(false) {
                        print("Player 1의 승리입니다!")
                        break outer
                    } else {
                        yutBoard[firstPlayerCurrentPosition[currentMal].y][firstPlayerCurrentPosition[currentMal].x] = firstPlayerMal
                        for malNumber in 0..<firstPlayerCurrentPosition.count {
                            if firstPlayerCurrentPosition[malNumber].x != -1 {
                                yutBoard[firstPlayerCurrentPosition[malNumber].y][firstPlayerCurrentPosition[malNumber].x] = firstPlayerMal
                            }
                        }
                        printYutBoard(yutBoard)
                    }
                    whosLast = 1
                    continue
                } else { // 1P가 2P를 안잡았을 때 -> 2P 먼저 시작
                    var currentMove = throwYut(player: 2)
                    var currentMal = 0
                    for malNumber in 0..<firstPlayerCurrentPosition.count {
                        if firstPlayerCurrentPosition[malNumber].x != -1 {
                            yutBoard[firstPlayerCurrentPosition[malNumber].y][firstPlayerCurrentPosition[malNumber].x] = firstPlayerMal
                        }
                    }
                    if secondPlayerCurrentPosition.count != 3 {
                        print("새로운 말을 움직이겠습니까? (y/n) ",terminator: "")
                        var answer = "n"
                        
                        if let typed = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines) {
                            answer = typed
                        }
                        if answer == "y" {
                            secondPlayerCurrentPosition.append(Position(y: -1, x: -1))
                            isSecondPlayerGallIn.append(false)
                            if secondPlayerCurrentPosition.count == 1 {
                                currentMal = 1
                            } else {
                                currentMal = 2
                            }
                        } else if answer == "n" {
                            if secondPlayerCurrentPosition.count == 1 {
                                currentMal = 0
                            } else {
                                print("몇번째 말을 움직이시겠습니까? 1, 2 중에 선택해주세요 : ", terminator: "")
                                guard let choosedMal = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!) else {
                                    fatalError("Bad Input")
                                }
                                while choosedMal != 1 || choosedMal != 2 {
                                    print("1, 2 중에 선택해주세요.")
                                    guard let choosedMal = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!) else {
                                        fatalError("Bad Input")
                                    }
                                }
                                currentMal = choosedMal-1
                            }
                        }
                        
                    } else if secondPlayerCurrentPosition.count == 3 {
                        print("몇번째 말을 움직이시겠습니까? 1, 2, 3 중에 선택해주세요 : ", terminator: "")
                        guard let choosedMal = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!) else {
                            fatalError("Bad Input")
                        }
                        while choosedMal != 1 || choosedMal != 2 || choosedMal != 3{
                            print("1, 2, 3 중에 선택해주세요.")
                            guard let choosedMal = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!) else {
                                fatalError("Bad Input")
                            }
                        }
                        currentMal = choosedMal - 1
                        
                    }
                    
                    if secondPlayerCurrentPosition[currentMal].x == -1 && currentMove == -1{ //출발 안했는데 빽도가 나온 경우
                        print("출발하지 않았기 때문에 이 말을 지정할 수 없습니다.")
                        for malNumber in 0..<secondPlayerCurrentPosition.count {
                            if secondPlayerCurrentPosition[malNumber].x != -1 {
                                yutBoard[secondPlayerCurrentPosition[malNumber].y][secondPlayerCurrentPosition[malNumber].x] = secondPlayerMal
                            }
                        }
                        printYutBoard(yutBoard)
                    } else {
                        if !isSecondPlayerGallIn.contains(false) {
                            print("Player 2의 승리입니다!")
                            break outer
                        } else {
                            yutBoard[secondPlayerCurrentPosition[currentMal].y][secondPlayerCurrentPosition[currentMal].x] = secondPlayerMal
                            for malNumber in 0..<secondPlayerCurrentPosition.count {
                                if secondPlayerCurrentPosition[malNumber].x != -1 {
                                    yutBoard[secondPlayerCurrentPosition[malNumber].y][secondPlayerCurrentPosition[malNumber].x] = secondPlayerMal
                                }
                            }
                            printYutBoard(yutBoard)
                        }
                    }
                    whosLast = 2
                    continue
                }
            case 2: //마지막으로 윷 던진 사람이 2일 경우
                var yutBoard = self.yutBoard
                if isCaptured(1).contains(true) { // 2P가 1P의 말을 잡았을 때 -> 2P 먼저 시작
                    let captured1PIndex = isCaptured(1).firstIndex(of: true)
                    self.secondPlayerCurrentPosition[captured1PIndex!].x = -1
                    self.secondPlayerCurrentPosition[captured1PIndex!].y = -1
                    for malNumber in 0..<firstPlayerCurrentPosition.count {
                        if secondPlayerCurrentPosition[malNumber].x != -1 {
                            yutBoard[secondPlayerCurrentPosition[malNumber].y][secondPlayerCurrentPosition[malNumber].x] = secondPlayerMal
                        }
                    }
                    print("2P가 1P의 말을 잡았으므로, 2P가 다시 윷을 던집니다.")
                    var currentMove = throwYut(player: 2)
                    var currentMal = 0
                    if secondPlayerCurrentPosition.count != 3 {
                        print("새로운 말을 움직이겠습니까? (y/n) ",terminator: "")
                        var answer = "n"
                        if let typed = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines) {
                            answer = typed
                        }
                        if answer == "y" {
                            secondPlayerCurrentPosition.append(Position(y: -1, x: -1))
                            isSecondPlayerGallIn.append(false)
                            if secondPlayerCurrentPosition.count == 1 {
                                currentMal = 1
                            } else {
                                currentMal = 2
                            }
                        } else if answer == "n" {
                            if secondPlayerCurrentPosition.count == 1 {
                                currentMal = 0
                            } else {
                                print("몇번째 말을 움직이시겠습니까? 1, 2 중에 선택해주세요 : ", terminator: "")
                                guard let choosedMal = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!) else {
                                    fatalError("Bad Input")
                                }
                                while choosedMal != 1 || choosedMal != 2 {
                                    print("1, 2 중에 선택해주세요.")
                                    guard let choosedMal = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!) else {
                                        fatalError("Bad Input")
                                    }
                                }
                                currentMal = choosedMal-1
                            }
                        }
                        
                    } else if secondPlayerCurrentPosition.count == 3 {
                        print("몇번째 말을 움직이시겠습니까? 1, 2, 3 중에 선택해주세요 : ", terminator: "")
                        guard let choosedMal = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!) else {
                            fatalError("Bad Input")
                        }
                        while choosedMal != 1 || choosedMal != 2 || choosedMal != 3{
                            print("1, 2, 3 중에 선택해주세요.")
                            guard let choosedMal = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!) else {
                                fatalError("Bad Input")
                            }
                        }
                        currentMal = choosedMal - 1
                        
                    }
                    currentMove = throwYut(player: 2)
                    self.secondPlayerCurrentPosition[currentMal] = moveMal(from: secondPlayerCurrentPosition[currentMal], by: currentMove, player: 1)
                    if !isSecondPlayerGallIn.contains(false) {
                        print("Player 2의 승리입니다!")
                        break outer
                    } else {
                        yutBoard[secondPlayerCurrentPosition[currentMal].y][secondPlayerCurrentPosition[currentMal].x] = secondPlayerMal
                        for malNumber in 0..<secondPlayerCurrentPosition.count {
                            if secondPlayerCurrentPosition[malNumber].x != -1 {
                                yutBoard[secondPlayerCurrentPosition[malNumber].y][secondPlayerCurrentPosition[malNumber].x] = secondPlayerMal
                            }
                        }
                        printYutBoard(yutBoard)
                    }
                    whosLast = 2
                    continue
                } else { // 안잡았을 때 -> 1P 먼저 시작
                    var currentMove = throwYut(player: 1)
                    var currentMal = 0
                    for malNumber in 0..<secondPlayerCurrentPosition.count {
                        if secondPlayerCurrentPosition[malNumber].x != -1 {
                            yutBoard[secondPlayerCurrentPosition[malNumber].y][secondPlayerCurrentPosition[malNumber].x] = secondPlayerMal
                        }
                    }
                    if firstPlayerCurrentPosition.count != 3 {
                        print("새로운 말을 움직이겠습니까? (y/n) ",terminator: "")
                        var answer = "n"
                        
                        if let typed = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines) {
                            answer = typed
                        }
                        if answer == "y" {
                            firstPlayerCurrentPosition.append(Position(y: -1, x: -1))
                            isFirstPlayerGallIn.append(false)
                            if firstPlayerCurrentPosition.count == 1 {
                                currentMal = 1
                            } else {
                                currentMal = 2
                            }
                        } else if answer == "n" {
                            if firstPlayerCurrentPosition.count == 1 {
                                currentMal = 0
                            } else {
                                print("몇번째 말을 움직이시겠습니까? 1, 2 중에 선택해주세요 : ", terminator: "")
                                guard let choosedMal = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!) else {
                                    fatalError("Bad Input")
                                }
                                while choosedMal != 1 || choosedMal != 2 {
                                    print("1, 2 중에 선택해주세요.")
                                    guard let choosedMal = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!) else {
                                        fatalError("Bad Input")
                                    }
                                }
                                currentMal = choosedMal-1
                            }
                        }
                        
                    } else if firstPlayerCurrentPosition.count == 3 {
                        print("몇번째 말을 움직이시겠습니까? 1, 2, 3 중에 선택해주세요 : ", terminator: "")
                        guard let choosedMal = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!) else {
                            fatalError("Bad Input")
                        }
                        while choosedMal != 1 || choosedMal != 2 || choosedMal != 3{
                            print("1, 2, 3 중에 선택해주세요.")
                            guard let choosedMal = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!) else {
                                fatalError("Bad Input")
                            }
                        }
                        currentMal = choosedMal - 1
                        
                    }
                    
                    if firstPlayerCurrentPosition[currentMal].x == -1 && currentMove == -1{ //출발 안했는데 빽도가 나온 경우
                        print("출발하지 않았기 때문에 이 말을 지정할 수 없습니다.")
                        for malNumber in 0..<firstPlayerCurrentPosition.count {
                            if firstPlayerCurrentPosition[malNumber].x != -1 {
                                yutBoard[firstPlayerCurrentPosition[malNumber].y][firstPlayerCurrentPosition[malNumber].x] = firstPlayerMal
                            }
                        }
                        printYutBoard(yutBoard)
                    } else {
                        if !isFirstPlayerGallIn.contains(false) {
                            print("Player 1의 승리입니다!")
                            break outer
                        } else {
                            yutBoard[firstPlayerCurrentPosition[currentMal].y][firstPlayerCurrentPosition[currentMal].x] = firstPlayerMal
                            for malNumber in 0..<firstPlayerCurrentPosition.count {
                                if firstPlayerCurrentPosition[malNumber].x != -1 {
                                    yutBoard[firstPlayerCurrentPosition[malNumber].y][firstPlayerCurrentPosition[malNumber].x] = firstPlayerMal
                                }
                            }
                            printYutBoard(yutBoard)
                        }
                    }
                    whosLast = 1
                    continue
                }
            default: continue
            }
        }
    }
    
    mutating func throwYut(player: Int) -> Int { //윷을 던지는 메소드
        var howManyMove: Int = 0
        var wantThrow = "n"
        while wantThrow != "y" {
            print("\(player)P의 윷을 던지시겠습니까? (y/n) ", terminator: "")
            if let typed = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines) {
                wantThrow = typed
            }
        } // "y" 입력할 때까지 계속 반복
        
        print("\(player)P의 윷을 던지겠습니다.")
        let probabilityInYut = [0,0,0,0,1,1,1,1,1,1]
        let yut1 = probabilityInYut.randomElement()!
        let yut2 = probabilityInYut.randomElement()!
        let yut3 = probabilityInYut.randomElement()!
        let backYut = probabilityInYut.randomElement()!
        let sum = yut1 + yut2 + yut3 + backYut
        switch sum {
        case 1:
            if backYut == 1 {
                print("빽도!")
                printYut(yut1, yut2, yut3, backYut)
                if isGetYutOrMo[player - 1] != true {
                    stackedYut[player - 1].removeAll()
                } else {
                    stackedYut[player - 1].append("빽도")
                    isGetYutOrMo[player - 1] = false
                }
                
                howManyMove = -1
            } else {
                print("도!")
                printYut(yut1, yut2, yut3, backYut)
                if isGetYutOrMo[player - 1] != true {
                    stackedYut[player - 1].removeAll()
                } else {
                    stackedYut[player - 1].append("도")
                    isGetYutOrMo[player - 1] = false
                }
                howManyMove = 1
            }
        case 2:
            print("개!")
            printYut(yut1, yut2, yut3, backYut)
            
            if isGetYutOrMo[player - 1] != true {
                stackedYut[player - 1].removeAll()
            } else {
                stackedYut[player - 1].append("개")
                isGetYutOrMo[player - 1] = false
            }
            howManyMove = 2
        case 3:
            print("걸!")
            printYut(yut1, yut2, yut3, backYut)
            
            if isGetYutOrMo[player - 1] != true {
                stackedYut[player - 1].removeAll()
            } else {
                stackedYut[player - 1].append("걸")
                isGetYutOrMo[player - 1] = false
            }
            
            howManyMove = 3
        case 4:
            print("윷!")
            printYut(yut1, yut2, yut3, backYut)
            
            stackedYut[player - 1].append("윷")
            isGetYutOrMo[player - 1] = true
            print("윷이 나왔으므로 \(player)P가 한 번 더 던지겠습니다.")
            _ = throwYut(player: player)
            if (stackedYut[player - 1].last == "윷" || stackedYut[player - 1].last == "모") && stackedYut[player - 1].count < 3  {_ = throwYut(player: player)}
            print("\(stackedYut[player - 1]) 중 사용하실 순서대로 숫자를 입력해주세요.")
            for (index,value) in stackedYut[player - 1].enumerated() {
                print("\(index+1) : \(value)")
            }
            
            guard let inputTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input")
            }
            let orderWantToUsemyYuts: [Int] = inputTemp.split(separator: " ").map {
                if let inputItem = Int($0) {
                    return inputItem
                } else {
                    fatalError("Bad input")
                }
            }
            for i in orderWantToUsemyYuts {
                switch stackedYut[player - 1][i-1] {
                case "도": howManyMove =  1
                case "개": howManyMove =  2
                case "걸": howManyMove =  3
                case "윷": howManyMove =  4
                case "모": howManyMove =  5
                case "빽도": howManyMove = -1
                default : howManyMove =  0
                }
            }
            stackedYut[player - 1].removeAll()
            
        case 0:
            print("모!")
            printYut(yut1, yut2, yut3, backYut)
            
            stackedYut[player - 1].append("모")
            isGetYutOrMo[0] = true
            print("모가 나왔으므로 \(player)P가 한 번 더 던지겠습니다.")
            _ = throwYut(player: player)
            if (stackedYut[player - 1].last == "윷" || stackedYut[player - 1].last == "모") && stackedYut[player - 1].count < 3 {_ = throwYut(player: player)}
            print("\(stackedYut[player - 1]) 중 사용하실 순서대로 숫자를 입력해주세요.")
            for (index,value) in stackedYut[player - 1].enumerated() {
                print("\(index+1) : \(value)")
            }
            guard let inputTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input")
            }
            let orderWantToUsemyYuts: [Int] = inputTemp.split(separator: " ").map {
                if let inputItem = Int($0) {
                    return inputItem
                } else {
                    fatalError("Bad input")
                }
            }
            for i in orderWantToUsemyYuts {
                switch stackedYut[player - 1][i-1] {
                case "도": howManyMove =  1
                case "개": howManyMove =  2
                case "걸": howManyMove =  3
                case "윷": howManyMove =  4
                case "모": howManyMove =  5
                case "빽도": howManyMove =  -1
                default : howManyMove =  0
                }
            }
            stackedYut[player - 1].removeAll()
            
        default: howManyMove = 0
        }
        return howManyMove
        
    }
    private func isRight(position: Position) -> Bool { //말의 위치가 윷판의 오른쪽편에 있는지?
        if position.x == 15 {return true}
        return false
    }
    private func isLeft(position: Position) -> Bool { //말의 위치가 윷판의 왼쪽편에 있는지?
        if position.x == 0 {return true}
        return false
    }
    private func isInIntersection(position: Position) -> Bool { //말의 위치가 윷판의 분기점에 있는지?
        if (position.x == 15 && position.y == 0) || (position.x == 0 && position.y == 0) {
            return true
        }
        return false
    }
    private func isTop(position: Position) -> Bool { //말의 위치가 윷판의 윗편에 있는지?
        if position.y == 0 {return true}
        return false
    }
    private func isBottom(position: Position) -> Bool { //말의 위치가 윷판의 아랫편에 있는지?
        if position.y == 10 {return true}
        return false
    }
    private func isStartingPoint(position: Position) -> Bool { // 말의 위치가 시작점에 있는지?
        if position.x == 15 && position.y == 10 {return true}
        return false
    }
    private func isNotStarted(position: Position) -> Bool { //말이 출발하기 전인지?
        if position.x == -1 && position.y == -1 {return true}
        return false
    }
    
    private mutating func moveMal(from origin: Position, by moveto: Int, player: Int) -> Position {
        let currentPosition = origin
        if isNotStarted(position: currentPosition) {
            if player == 1{
                self.isFirstPlayerGallIn[0] = false
            } else {
                self.isSecondPlayerGallIn[0] = false
            }
            if moveto == -1 {return Position(y: -1, x: -1)}
            else {return Position(y: 10 - 2*moveto, x: 15)}
        } else if isInIntersection(position: currentPosition){
            if currentPosition.x == 15 && currentPosition.y == 0 { // 우측 상단 분기점에 위치했을 경우,
                print("안쪽으로 들어가려면 1을, 바깥쪽을 돌려면 2를 입력해주세요. ",terminator: "")
                guard let input = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!) else {
                    return Position(y:-1,x:-1)
                }
                if input == 1 {
                    if player == 1 {isFromFirstIntersection[0] = 1}
                    else {isFromFirstIntersection[1] = 1}
                    if moveto == 1 {return Position(y:2,x:12)}
                    else if moveto == 2 {return Position(y: 4, x: 9)}
                    else if moveto == 3 {return Position(y: 5, x: 8)}
                    else if moveto == 4 {return Position(y: 6, x: 6)}
                    else if moveto == 5 {return Position(y: 8, x: 3)}
                    else if moveto == -1 {return Position(y: 2, x: 15)}
                } else {
                    let movedPositionX = currentPosition.x - 3*moveto
                    switch movedPositionX {
                    case ..<0:
                        return Position(y: currentPosition.y + 2*(moveto-currentPosition.x/2), x:0)
                    default:
                        return Position(y: currentPosition.y, x:movedPositionX)
                    }
                }
            } else if currentPosition.x == 0 && currentPosition.y == 0 { // 좌측 상단 분기점에 위치했을 경우,
                if player == 1 {isFromFirstIntersection[0] = 0}
                else {isFromFirstIntersection[1] = 0}
                print("안쪽으로 들어가려면 1을, 바깥쪽을 돌려면 2를 입력해주세요. ",terminator: "")
                guard let input = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!) else {
                    return Position(y:-1,x:-1)
                }
                if input == 1 {
                    if moveto == 1 {return Position(y:2,x:3)}
                    else if moveto == 2 {return Position(y: 4, x: 6)}
                    else if moveto == 3 {return Position(y: 5, x: 8)}
                    else if moveto == 4 {return Position(y: 6, x: 9)}
                    else if moveto == 5 {return Position(y: 8, x: 12)}
                    else if moveto == -1 {return Position(y: 0, x: 3)}
                } else {
                    let movedPositionY = currentPosition.y + 2*moveto
                    switch movedPositionY {
                    case 11...:
                        return Position(y: 10, x:currentPosition.x + 3*(moveto-(10-currentPosition.y)/2))
                    default:
                        return Position(y: movedPositionY, x:currentPosition.x)
                    }
                }
            }
        } else if ((currentPosition.y == 2 && currentPosition.x == 12) || // 첫번째 분기점에서 분기한 지점인 경우
                   (currentPosition.y == 4 && currentPosition.x ==  9) ||
                   (currentPosition.y == 5 && currentPosition.x == 8) ||
                   (currentPosition.y == 6 && currentPosition.x == 6) ||
                   (currentPosition.y == 8 && currentPosition.x == 3)) && ((player == 1 && isFromFirstIntersection[0] == 1)||(player == 2 && isFromFirstIntersection[1] == 1)){
            switch (currentPosition.y, currentPosition.x) {
            case (2,12):
                switch moveto {
                case -1: return Position(y: 0, x: 15)
                case 1: return Position(y: 4, x: 9)
                case 2: return Position(y: 5, x: 8)
                case 3: return Position(y: 6, x: 6)
                case 4: return Position(y: 8, x: 3)
                case 5: return Position(y: 10, x: 0)
                default: return Position(y: -1, x: -1)
                }
            case (4,9):
                switch moveto {
                case -1: return Position(y: 2, x: 12)
                case 1: return Position(y: 5, x: 8)
                case 2: return Position(y: 6, x: 6)
                case 3: return Position(y: 8, x: 3)
                case 4: return Position(y: 10, x: 0)
                case 5: return Position(y: 10, x: 3)
                default: return Position(y: -1, x: -1)
                }
            case (6,6):
                switch moveto {
                case -1: return Position(y: 5, x: 8)
                case 1: return Position(y: 8, x: 3)
                case 2: return Position(y: 10, x: 0)
                case 3: return Position(y: 10, x: 3)
                case 4: return Position(y: 10, x: 6)
                case 5: return Position(y: 10, x: 9)
                default: return Position(y: -1, x: -1)
                }
            case (8,3):
                switch moveto {
                case -1: return Position(y: 6, x: 6)
                case 1: return Position(y: 10, x: 0)
                case 2: return Position(y: 10, x: 3)
                case 3: return Position(y: 10, x: 6)
                case 4: return Position(y: 10, x: 9)
                case 5: return Position(y: 10, x: 12)
                default: return Position(y: -1, x: -1)
                }
            case (5,8):
                print("오른쪽으로 가려면 1을, 왼쪽으로 가려면 2를 입력해주세요. ",terminator: "")
                guard let input = readLine().map({Int($0)}) else {
                    return Position(y:-1,x:-1)
                }
                if input == 1 {
                    if player == 1 {
                        isComingBack[0] = true
                    } else {
                        isComingBack[1] = true
                    }
                    switch moveto {
                    case -1: return Position(y: 4, x: 9)
                    case 1: return Position(y: 6, x: 9)
                    case 2: return Position(y: 8, x: 12)
                    case 3: return Position(y: 10, x: 15)
                    default:
                        if player == 1 {
                            self.isFirstPlayerGallIn[0] = true
                        } else {
                            self.isSecondPlayerGallIn[0] = true
                        }
                        return Position(y: 100, x: 100)
                    }
                } else {
                    switch moveto {
                    case -1: return Position(y: 4, x: 9)
                    case 1: return Position(y: 6, x: 6)
                    case 2: return Position(y: 8, x: 3)
                    case 3: return Position(y: 10, x: 0)
                    case 4: return Position(y: 10, x: 3)
                    case 5: return Position(y: 10, x: 6)
                    default: return Position(y: -1, x: -1)
                    }
                }
            default: return Position(y: -1, x: -1)
            }
        } else if ((currentPosition.y == 2 && currentPosition.x == 3) || // 두번째 분기점에서 분기한 지점인 경우
                   (currentPosition.y == 4 && currentPosition.x ==  6) ||
                   (currentPosition.y == 5 && currentPosition.x == 8) ||
                   (currentPosition.y == 6 && currentPosition.x == 9) ||
                   (currentPosition.y == 8 && currentPosition.x == 12)) && ((player == 1 && isFromFirstIntersection[0] == 0)||(player == 2 && isFromFirstIntersection[1] == 0)){
            if player == 1 {
                isComingBack[0] = true
            } else {
                isComingBack[1] = true
            }
            switch (currentPosition.y, currentPosition.x) {
            case (2,3):
                switch moveto {
                case -1: return Position(y: 0, x: 0)
                case 1: return Position(y: 4, x: 6)
                case 2: return Position(y: 5, x: 8)
                case 3: return Position(y: 6, x: 9)
                case 4: return Position(y: 8, x: 12)
                case 5: return Position(y: 10, x: 15)
                default: return Position(y: -1, x: -1)
                }
            case (4,6):
                switch moveto {
                case -1: return Position(y: 2, x: 3)
                case 1: return Position(y: 5, x: 8)
                case 2: return Position(y: 6, x: 9)
                case 3: return Position(y: 8, x: 12)
                case 4: return Position(y: 10, x: 15)
                default:
                    if player == 1 {
                        self.isFirstPlayerGallIn[0] = true
                        isComingBack[0] = true
                    } else {
                        self.isSecondPlayerGallIn[0] = true
                        isComingBack[1] = true
                    }
                    return Position(y: 100, x: 100)
                }
            case (5,8):
                switch moveto {
                case -1: return Position(y: 4, x: 6)
                case 1: return Position(y: 6, x: 9)
                case 2: return Position(y: 8, x: 12)
                case 3: return Position(y: 10, x: 15)
                default:
                    if player == 1 {
                        self.isFirstPlayerGallIn[0] = true
                    } else {
                        self.isSecondPlayerGallIn[0] = true
                    }
                    return Position(y: 100, x: 100)
                }
            case (6,9):
                if player == 1 {
                    isComingBack[0] = true
                } else {
                    isComingBack[1] = true
                }
                switch moveto {
                case -1: return Position(y: 5, x: 8)
                case 1: return Position(y: 8, x: 12)
                case 2: return Position(y: 10, x: 15)
                default:
                    if player == 1 {
                        self.isFirstPlayerGallIn[0] = true
                    } else {
                        self.isSecondPlayerGallIn[0] = true
                    }
                    return Position(y: 100, x: 100)
                }
            case (8,12):
                switch moveto {
                case -1: return Position(y: 6, x: 9)
                case 1: return Position(y: 10, x: 15)
                default:
                    if player == 1 {
                        self.isFirstPlayerGallIn[0] = true
                    } else {
                        self.isSecondPlayerGallIn[0] = true
                    }
                    return Position(y: 100, x: 100)
                }
            default: return Position(y: -1, x: -1)
            }
        } else if isStartingPoint(position: currentPosition) && ((player == 1 && isComingBack[0] == true)||(player == 2 && isComingBack[1] == true)){
            if player == 1 {
                
            }
        } else if isRight(position: currentPosition){
            if isStartingPoint(position: currentPosition) && moveto == -1 { //도 -> 빽도 -> 빽도로 골인하는 경우
                if player == 1 {
                    self.isFirstPlayerGallIn[0] = true
                } else {
                    self.isSecondPlayerGallIn[0] = true
                }
                return Position(y: 100, x: 100)
            }
            if player == 1 {
                isComingBack[0] = false
            } else {
                isComingBack[1] = false
            }
            let movedPositionY = currentPosition.y - 2*moveto
            switch movedPositionY {
            case ..<0:
                return Position(y: 0, x:currentPosition.x - 3*(moveto-currentPosition.y/2))
            default:
                return Position(y: movedPositionY, x:currentPosition.x)
            }
        } else if isTop(position: currentPosition) {
            if player == 1 {
                isComingBack[0] = false
            } else {
                isComingBack[1] = false
            }
            let movedPositionX = currentPosition.x - 3*moveto
            switch movedPositionX {
            case ..<0:
                return Position(y: currentPosition.y + 2*(moveto-currentPosition.x/2), x:0)
            default:
                return Position(y: currentPosition.y, x:movedPositionX)
            }
        } else if isLeft(position: currentPosition) {
            let movedPositionY = currentPosition.y + 2*moveto
            switch movedPositionY {
            case 11...:
                return Position(y: 10, x:currentPosition.x + 3*(moveto-(10-currentPosition.y)/2))
            default:
                return Position(y: movedPositionY, x:currentPosition.x)
            }
        } else if isBottom(position: currentPosition) {
            if player == 1 {
                isComingBack[0] = true
            } else {
                isComingBack[1] = true
            }
            let movedPositionX = currentPosition.x + 3*moveto
            switch movedPositionX {
            case 16...:
                if player == 1{
                    isComingBack[0] = true
                    self.isFirstPlayerGallIn[0] = true
                } else {
                    isComingBack[1] = true
                    self.isSecondPlayerGallIn[0] = true
                }
                return Position(y: 100, x: 100)
            default:
                return Position(y: currentPosition.y, x: movedPositionX)
            }
        }
        return Position(y: 0, x: 0)
    }
    
    private func isCaptured(_ player: Int) -> [Bool] {
        var capturedBoolArray = [false, false, false]
        for (index1,position1) in firstPlayerCurrentPosition.enumerated() {
            for (index2,position2) in secondPlayerCurrentPosition.enumerated() {
                if position1.x != -1 && position2.x != -1 {
                    if position1.x == position2.x && position1.y == position2.y {
                        if player == 1 {
                            capturedBoolArray[index1] = true
                        } else if player == 2 {
                            capturedBoolArray[index2] = true
                        }
                    }
                }
            }
        }
        return capturedBoolArray
    }
    //    private func isNotStartedYet() -> Bool {
    //
    //    }
}




