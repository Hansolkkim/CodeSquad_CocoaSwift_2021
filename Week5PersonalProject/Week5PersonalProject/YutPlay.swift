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
    var isFirstPlayerGallIn:[Bool] = [false]
    var isSecondPlayerGallIn:[Bool] = [false]
    var firstPlayerMal: String = "🟤"
    var secondPlayerMal: String = "🟤"
    var whosFirst: Int = 0
    var whosLast: Int = 0
    
    init() {
        print("윷놀이 게임 시작!")
        //        print("3개의 말이 먼저 들어오는 사람이 승리합니다.")
        print("1P의 말의 색깔을 선택하세요.")
        print("1 : 🔴, 2 : 🟠, 3 : 🟡, 4 : 🟢, 5 : 🔵, 6 : 🟣")
        if let input1 = readLine().map({Int($0)}) {
            firstPlayerMal = selectMalColor(input: input1!, number: 1)
        } else {
            print("입력값이 없습니다.")
            print("1P의 말은 랜덤으로 지정 됩니다.")
            print("1P의 말은 🟤 입니다.")
            firstPlayerMal = "🟤"
        }
        print("")
        print("2P의 말의 색깔을 선택하세요.")
        print("1 : 🔴, 2 : 🟠, 3 : 🟡, 4 : 🟢, 5 : 🔵, 6 : 🟣")
        if let input2 = readLine().map({Int($0)}) {
            secondPlayerMal = selectMalColor(input: input2!, number: 2)
        } else {
            print("입력값이 없습니다.")
            print("2P의 말은 랜덤으로 지정 됩니다.")
            print("2P의 말은 🟤 입니다.")
            firstPlayerMal = "🟤"
        }
        for i in 0..<self.yutBoard.count {
            for j in 0..<self.yutBoard[0].count {
                print(yutBoard[i][j], terminator: "")
            }
            print("")
        }
        print("                      시작 위치는 ↑ 여기입니다.")
        whosFirst = Int.random(in: 1...2)
        func selectMalColor(input : Int, number : Int) -> String {
            
            switch input {
            case 1 :
                print("\(number)P의 말은 🔴 입니다.")
                return "🔴"
            case 2 :
                print("\(number)P의 말은 🟠 입니다.")
                return "🟠"
            case 3 :
                print("\(number)P의 말은 🟡 입니다.")
                return "🟡"
            case 4 :
                print("\(number)P의 말은 🟢 입니다.")
                return "🟢"
            case 5 :
                print("\(number)P의 말은 🔵 입니다.")
                return "🔵"
            case 6 :
                print("\(number)P의 말은 🟣 입니다.")
                return "🟣"
            default:
                print("입력값이 1~6 이외의 값이므로 말이 랜덤으로 선택됩니다.")
                print("\(number)P의 말은 🟤 입니다.")
                return "🟤"
            }
        }
    }
    
    mutating func startGame() { //중심 메소드
        print("시작 Player는 랜덤으로 정해집니다")
        print("\(self.whosFirst)P 가 먼저 시작하겠습니다!")
        if self.whosFirst == 1 {
            var yutBoard = self.yutBoard
            self.firstPlayerCurrentPosition[0] = throwYut(mal: firstPlayerCurrentPosition[0], player: 1)
            if firstPlayerCurrentPosition[0].x == -1 && firstPlayerCurrentPosition[0].y == -1 {
                print("출발하지 않았기 때문에 무효")
            } else {
                yutBoard[firstPlayerCurrentPosition[0].y][firstPlayerCurrentPosition[0].x] = firstPlayerMal
                printYutBoard(yutBoard)
            }
            whosLast = 1

        } else {
            var yutBoard = self.yutBoard
            self.secondPlayerCurrentPosition[0] = throwYut(mal: secondPlayerCurrentPosition[0], player: 2)
            if secondPlayerCurrentPosition[0].x == -1 && secondPlayerCurrentPosition[0].y == -1 {
                print("출발하지 않았기 때문에 무효")
            } else {
                yutBoard[secondPlayerCurrentPosition[0].y][secondPlayerCurrentPosition[0].x] = secondPlayerMal
                printYutBoard(yutBoard)
            }
            whosLast = 2
//            self.firstPlayerCurrentPosition[0] = throwYut(mal: firstPlayerCurrentPosition[0], player: 1)
//            if firstPlayerCurrentPosition[0].x == -1 && firstPlayerCurrentPosition[0].y == -1 {
//                print("출발하지 않았기 때문에 무효")
//            } else {
//                yutBoard[firstPlayerCurrentPosition[0].y][firstPlayerCurrentPosition[0].x] = firstPlayerMal
//                printYutBoard(yutBoard)
//            }
//            whosLast = 1
        }
        
        while (isFirstPlayerGallIn[0] == false) || (isSecondPlayerGallIn[0] == false) {
            switch whosLast {
            case 1: //마지막으로 윷 던진 사람이 1일 경우
                var yutBoard = self.yutBoard
                if firstPlayerCurrentPosition[0].x == secondPlayerCurrentPosition[0].x && firstPlayerCurrentPosition[0].y == secondPlayerCurrentPosition[0].y && firstPlayerCurrentPosition[0].x != -1 && secondPlayerCurrentPosition[0].x != -1{ // 1P가 2P의 말을 잡았을 때 -> 1P 먼저 시작
                    self.secondPlayerCurrentPosition[0].x = -1; self.secondPlayerCurrentPosition[0].y = -1
                    print("1P가 2P의 말을 잡았으므로, 1P가 다시 윷을 던집니다.")
                    self.firstPlayerCurrentPosition[0] = throwYut(mal: firstPlayerCurrentPosition[0], player: 1)
                    if isFirstPlayerGallIn[0] == true {
                        print("Player 1의 승리입니다!")
                        break
                    } else {
                        yutBoard[firstPlayerCurrentPosition[0].y][firstPlayerCurrentPosition[0].x] = firstPlayerMal
                        printYutBoard(yutBoard)
                    }
                    whosLast = 1
                    continue
                } else { // 안잡았을 때 -> 2P 먼저 시작
                    yutBoard[firstPlayerCurrentPosition[0].y][firstPlayerCurrentPosition[0].x] = firstPlayerMal
                    self.secondPlayerCurrentPosition[0] = throwYut(mal: secondPlayerCurrentPosition[0], player: 2)
                    if secondPlayerCurrentPosition[0].x == -1 { //출발 안했는데 빽도가 나온 경우
                        print("출발하지 않았기 때문에 무효")
                        printYutBoard(yutBoard)
                    } else {
                        if isSecondPlayerGallIn[0] == true {
                            print("Player 2의 승리입니다!")
                            break
                        } else {
                            yutBoard[secondPlayerCurrentPosition[0].y][secondPlayerCurrentPosition[0].x] = secondPlayerMal
                            printYutBoard(yutBoard)
                        }
                    }
                    whosLast = 2
                    continue
                }
            case 2: //마지막으로 윷 던진 사람이 2일 경우
                var yutBoard = self.yutBoard
                if firstPlayerCurrentPosition[0].x == secondPlayerCurrentPosition[0].x && firstPlayerCurrentPosition[0].y == secondPlayerCurrentPosition[0].y && firstPlayerCurrentPosition[0].x != -1 && secondPlayerCurrentPosition[0].x != -1{ // 2P가 1P의 말을 잡았을 때 -> 2P 먼저 시작
                    firstPlayerCurrentPosition[0].x = -1; firstPlayerCurrentPosition[0].y = -1
                    print("2P가 1P의 말을 잡았으므로, 2P가 다시 윷을 던집니다.")
                    self.secondPlayerCurrentPosition[0] = throwYut(mal: secondPlayerCurrentPosition[0], player: 2)
                    if isSecondPlayerGallIn[0] == true {
                        print("Player 2의 승리입니다!")
                        break
                    } else {
                        yutBoard[secondPlayerCurrentPosition[0].y][secondPlayerCurrentPosition[0].x] = secondPlayerMal
                        printYutBoard(yutBoard)
                    }
                    whosLast = 2
                    continue
                } else { // 안잡았을 때 -> 1P 먼저 시작
                    yutBoard[secondPlayerCurrentPosition[0].y][secondPlayerCurrentPosition[0].x] = secondPlayerMal
                    self.firstPlayerCurrentPosition[0] = throwYut(mal: firstPlayerCurrentPosition[0], player: 1)
                    if firstPlayerCurrentPosition[0].x == -1 {
                        print("출발하지 않았기 때문에 무효")
                        printYutBoard(yutBoard)
                    } else {
                        if isFirstPlayerGallIn[0] == true {
                            print("Player 1의 승리입니다!")
                            break
                        } else {
                            yutBoard[firstPlayerCurrentPosition[0].y][firstPlayerCurrentPosition[0].x] = firstPlayerMal
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
    mutating func throwYut(mal: Position, player: Int) -> Position{ //윷을 던지는 메소드
        var mal = mal
        var wantThrow = "N"
        while wantThrow != "Y" {
            print("\(player)P의 윷을 던지시겠습니까? (Y/N) ", terminator: "")
            if let typed = readLine() {
                wantThrow = typed
            }
        }
        
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
                mal = moveMal(from: mal, by: -1, player: player)
                printYut(yut1, yut2, yut3, backYut)
            } else {
                print("도!")
                mal = moveMal(from: mal, by: 1, player: player)
                printYut(yut1, yut2, yut3, backYut)
            }
        case 2:
            print("개!")
            mal = moveMal(from: mal, by: 2, player: player)
            printYut(yut1, yut2, yut3, backYut)
        case 3:
            print("걸!")
            mal = moveMal(from: mal, by: 3, player: player)
            printYut(yut1, yut2, yut3, backYut)
        case 4:
            print("윷!")
            mal = moveMal(from: mal, by: 4, player: player)
            printYut(yut1, yut2, yut3, backYut)
        case 5:
            print("모!")
            mal = moveMal(from: mal, by: 5, player: player)
            printYut(yut1, yut2, yut3, backYut)
        default: return Position(y: 0, x: 0)
        }
        return mal
        
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
        if (position.x == 15 && position.y == 0) || (position.x == 0 && position.y == 0) || (position.x == 0 && position.y == 10) || (position.x == 8 && position.y == 5) {
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
        if position.x == 15 && position.y == 8 {return true}
        return false
    }
    private func isNotStarted(position: Position) -> Bool { //말이 출발하기 전인지?
        if position.x == -1 && position.y == -1 {return true}
        return false
    }
    
    private mutating func moveMal(from origin: Position, by moveto: Int, player: Int) -> Position {
        let currentPosition = origin
        switch moveto {
        case -1:
            if isNotStarted(position: currentPosition) { //말이 출발하기 전이라면 무효처리
                return Position(y: -1, x: -1)
            } else if isStartingPoint(position: currentPosition) { //만약 첫째자리라면 골인
                if player == 1{
                    self.isFirstPlayerGallIn.append(true)
                } else {
                    self.isSecondPlayerGallIn.append(true)
                }
                
                return Position(y: -1, x: -1)
            } else if isRight(position: currentPosition) {
                return Position(y: currentPosition.y+2, x: currentPosition.x)
            } else if isTop(position: currentPosition) {
                return Position( y: currentPosition.y, x: currentPosition.x+3)
            } else if isLeft(position: currentPosition) {
                return Position(y: currentPosition.y-2, x: currentPosition.x)
            } else if isBottom(position: currentPosition) {
                return Position(y: currentPosition.y, x: currentPosition.x-3)
            }
            
        default:
            if isNotStarted(position: currentPosition) {
                if player == 1{
                    self.isFirstPlayerGallIn[0] = false
                } else {
                    self.isSecondPlayerGallIn[0] = false
                }
                return Position(y: 10 - 2*moveto, x: 15)
            } else if isStartingPoint(position: currentPosition){
                
                if player == 1{
                    self.isFirstPlayerGallIn[0] = true
                } else {
                    self.isSecondPlayerGallIn[0] = true
                }
                return Position(y: 100, x: 100)
            }
            else if isRight(position: currentPosition){
                let movedPositionY = currentPosition.y - 2*moveto
                switch movedPositionY {
                case ..<0:
                    return Position(y: 0, x:currentPosition.x - 3*(moveto-currentPosition.y/2))
                default:
                    return Position(y: movedPositionY, x:currentPosition.x)
                }
            } else if isTop(position: currentPosition) {
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
                let movedPositionX = currentPosition.x + 3*moveto
                switch movedPositionX {
                case 16...:
                    if player == 1{
                        self.isFirstPlayerGallIn[0] = true
                    } else {
                        self.isSecondPlayerGallIn[0] = true
                    }
                    return Position(y: 100, x: 100)
                default:
                    return Position(y: currentPosition.y, x: movedPositionX)
                }
            }
        }
        return Position(y: 0, x: 0)
    }
    
}

