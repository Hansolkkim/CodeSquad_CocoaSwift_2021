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
    
    var playerCurrentPosition = [[Position(y: -1, x: -1)],[Position(y: -1, x: -1)]]
    var playerMalColor:[String] = ["🟤","⚫️"]
    var whosFirst: Int = 0 // 누가 먼저 시작하는지 저장해놓는 변수
    var whosLast: Int = 0 // while문이 돌면서 마지막으로 던진 사람이 계속 변할 수 있기 때문에, while문 반복 한 번이 끝날때마다 누가 마지막으로 던졌는지를 저장해주는 변수
    var isFromFirstIntersection: [[Int]] = [[0,0,0],[0,0,0]] // 첫번째 분기점에서 한 가운데 지점으로 갈 경우에만 선택지를 2개(오른쪽으로, 왼쪽으로) 가질 수 있으므로 flag bit 사용
    var isComingBack: [[Bool]] = [[false,false,false], [false,false,false]] // YutBoard의 y=10, x=15 지점에 말이 온 경우, isRight()함수 호출시 말이 윷판의 오른쪽에 있다고 인식되므로 다시 출발하는 말로 인식이 됨.
    // 만약 한바퀴를 돌거나, 도->빽도->빽도의 경우에는 그 말에 해당하는 isComingBack의 값을 true로 해주어, 이 말은 골인하는 중이라는 것을 표시해주는 변수
    var stackedYut: [[String]] = [[],[]] //윷,모가 나올 경우 더 던질 수 있으므로, 나왔던 윷 모양을 저장해놓는 변수
//    var previousPosition: [[Position]] = [[Position(y: -1, x: -1), Position(y: -1, x: -1), Position(y: -1, x: -1)], [Position(y: -1, x: -1), Position(y: -1, x: -1), Position(y: -1, x: -1)]]
    mutating func setMalColor() {
        printGameStart()
        print("1P의 말의 색깔을 선택하세요.")
        print("1 : 🔴, 2 : 🟠, 3 : 🟡, 4 : 🟢, 5 : 🔵, 6 : 🟣")
        
        guard let input1 = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!) else {
            print("입력값이 옳지않습니다.")
            print("Player의 말은 랜덤으로 지정 됩니다.")
            print("1P의 말은 🟤 입니다.")
            print("2P의 말은 ⚫️ 입니다.")
            playerMalColor[1-1] = "🟤"
            playerMalColor[2-1] = "⚫️"
            whosFirst = Int.random(in: 1...2)
            printYutBoard(yutBoard)
            print("                                                                    시작 위치는 ↑ 여기입니다.")
            return
        }
        playerMalColor[1-1] = selectMalColor(input: input1, player: 1)
        
        print("")
        print("2P의 말의 색깔을 선택하세요.")
        print("1 : 🔴, 2 : 🟠, 3 : 🟡, 4 : 🟢, 5 : 🔵, 6 : 🟣")
        
        guard let input2 = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!) else {
            print("입력값이 옳지않습니다.")
            print("2P의 말은 랜덤으로 지정 됩니다.")
            print("2P의 말은 ⚫️ 입니다.")
            playerMalColor[2-1] = "⚫️"
            whosFirst = Int.random(in: 1...2)
            printYutBoard(yutBoard)
            print("                                                                    시작 위치는 ↑ 여기입니다.")
            return
        }
        playerMalColor[2-1] = selectMalColor(input: input2, player: 2)
        
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
        //        isPlayerGallin[whosFirst-1].append(false)
        var currentMove = throwYut(player: whosFirst, currentYutBoard: yutBoard)
        if currentMove == -1 { //처음 던질 때부터 빽도가 나올 경우 이 Position을 yutboard에 입력해주면 index error가 발생하므로, 이 경우를 해결해주기 위한 코드
            print("출발하지 않았기 때문에 무효")
            playerCurrentPosition[whosFirst-1].remove(at: 0)
        } else {
            self.playerCurrentPosition[whosFirst-1][0] =
            moveMal(from: playerCurrentPosition[whosFirst-1][0], by: currentMove, player: whosFirst, targetMal: 0)
            yutBoard = reloadYutBoard(playerCurrentPosition, which: whosFirst+2)
            
            printYutBoard(yutBoard)
        }
        whosLast = whosFirst
        if whosFirst == 1 { whosFirst = 2 }
        else {whosFirst = 1}
        currentMove = throwYut(player: whosFirst, currentYutBoard: yutBoard)
        if currentMove == -1{
            playerCurrentPosition[whosFirst-1].remove(at: 0)
            print("출발하지 않았기 때문에 무효")
        } else {
            self.playerCurrentPosition[whosFirst-1][0] = moveMal(from: playerCurrentPosition[whosFirst-1][0], by: currentMove, player: whosFirst, targetMal: 0)
            yutBoard = reloadYutBoard(playerCurrentPosition, which: whosFirst+2)
            printYutBoard(yutBoard)
        }
        whosLast = whosFirst
        outer : while !isAllMalsGallin(player: 1, playerCurrentPosition: self.playerCurrentPosition) && !isAllMalsGallin(player: 2, playerCurrentPosition: self.playerCurrentPosition){
            inner : switch whosLast { // 마지막으로 윷을 던진 Player에 따른 switch문
            case 1:
                if isCaptured(2,playerCurrentPosition).contains(true) { // 1P가 2P의 말을 잡았을 때 -> 1P 먼저 시작
                    sequence1(1, self.yutBoard)
                    whosLast = 1
                } else { // 1P가 2P를 안잡았을 때 -> 2P 먼저 시작
                    sequence2(2, self.yutBoard)
                    whosLast = 2
                }
            case 2: //마지막으로 윷 던진 사람이 2일 경우
                if isCaptured(1,self.playerCurrentPosition).contains(true) { // 2P가 1P의 말을 잡았을 때 -> 2P 먼저 시작
                    sequence1(2, self.yutBoard)
                    whosLast = 2
                } else { // 안잡았을 때 -> 1P 먼저 시작
                    sequence2(1, self.yutBoard)
                    whosLast = 1
                }
            default:
                continue
            }
        }
    }
    
    mutating func throwYut(player: Int, currentYutBoard: [[String]]) -> Int { //윷을 던지는 메소드
        var yutBoard = currentYutBoard
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
                return -1
            } else {
                print("도!")
                printYut(yut1, yut2, yut3, backYut)
                return 1
            }
        case 2:
            print("개!")
            printYut(yut1, yut2, yut3, backYut)
            return 2
        case 3:
            print("걸!")
            printYut(yut1, yut2, yut3, backYut)
            return 3
            
        case 4:
            print("윷!")
            printYut(yut1, yut2, yut3, backYut)
            stackedYut[player - 1].append("윷")
            stackedYut[player - 1] = treatYutOrMo(target: stackedYut[player-1], player: player)
            while stackedYut[player-1].count != 0 {
                if playerCurrentPosition[player-1].count != 0 {
                    
                }
                print("현재 움직일 수 있는 말은 \(playerCurrentPosition[player-1].count)개 있습니다.")
                for (index, position) in playerCurrentPosition[player-1].enumerated() {
                    if position.x == 100 {
                        print("\(index + 1) : ( 완주 )")
                    } else {
                        print("\(index + 1) : (\(position.x) , \(position.y))")
                    }
                }
                let currentMove = stackedYut[player-1].removeFirst()
                stackedYut[player-1].insert(currentMove, at: 0)
                print("\(stackedYut[player-1]) 중, [\(stackedYut[player-1].removeFirst())](으)로는 몇번째 말을 움직이시겠습니까? ", terminator: "")
                if playerCurrentPosition[player-1].count != 3 { print("새로운 말을 움직이시려면 0을 입력해주세요. : ", terminator: "")}
                guard let choosedMal = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!) else {
                    fatalError("Bad Input")
                }
                var by: Int
                switch currentMove {
                case "빽도": by = -1
                case "도": by = 1
                case "개": by = 2
                case "걸": by = 3
                case "윷": by = 4
                case "모": by = 5
                default: by = 0
                }
                if choosedMal == 0 {
                    playerCurrentPosition[player-1].append(Position(y: -1, x: -1))
                    playerCurrentPosition[player-1][playerCurrentPosition[player-1].count-1] = moveMal(from: playerCurrentPosition[player-1][playerCurrentPosition[player-1].count-1], by: by, player: player, targetMal: playerCurrentPosition[player-1].count-1)
//                    yutBoard = reloadYutBoard(playerCurrentPosition, which: player)
//                    yutBoard[playerCurrentPosition[player-1][playerCurrentPosition[player-1].count-1].y][playerCurrentPosition[player-1][playerCurrentPosition[player-1].count-1].x] = playerMalColor[player-1]
                } else {
                    playerCurrentPosition[player-1][choosedMal-1] = moveMal(from: playerCurrentPosition[player-1][choosedMal-1], by: by, player: player, targetMal: choosedMal-1)
                }
                yutBoard = reloadYutBoard(playerCurrentPosition, which: player+2)
                if stackedYut[player-1].count != 0 {printYutBoard(yutBoard)}
                var otherPlayer = 0
                if player == 1 { otherPlayer = 2 }
                else { otherPlayer = 1 }
                if isCaptured(otherPlayer,playerCurrentPosition).contains(true) { // 1P가 2P의 말을 잡았을 때 -> 1P 먼저 시작
                    sequence1(player, yutBoard)
                    whosLast = player
                    yutBoard = reloadYutBoard(playerCurrentPosition, which: player+2)
                }
                if isCaptured(otherPlayer,playerCurrentPosition).contains(true) { // 1P가 2P의 말을 잡았을 때 -> 1P 먼저 시작
                    sequence1(player, yutBoard)
                    whosLast = player
                    yutBoard = reloadYutBoard(playerCurrentPosition, which: player+2)
                }
                if isCaptured(otherPlayer,playerCurrentPosition).contains(true) { // 1P가 2P의 말을 잡았을 때 -> 1P 먼저 시작
                    sequence1(player, yutBoard)
                    whosLast = player
                    yutBoard = reloadYutBoard(playerCurrentPosition, which: player+2)
                }
            }
            
        case 0:
            print("모!")
            printYut(yut1, yut2, yut3, backYut)
            
            stackedYut[player - 1].append("모")
            stackedYut[player-1] = treatYutOrMo(target: stackedYut[player-1], player: player)
            while stackedYut[player-1].count != 0 {
                print("현재 움직일 수 있는 말은 \(playerCurrentPosition[player-1].count)개 있습니다.")
                for (index, position) in playerCurrentPosition[player-1].enumerated() {
                    if position.x == 100 {
                        print("\(index + 1) : ( 완주 )")
                    } else {
                        print("\(index + 1) : (\(position.x) , \(position.y))")
                    }
                }
                let currentMove = stackedYut[player-1].removeFirst()
                stackedYut[player-1].insert(currentMove, at: 0)
                print("\(stackedYut[player-1]) 중, [\(stackedYut[player-1].removeFirst())](으)로는 몇번째 말을 움직이시겠습니까?", terminator: "")
                if playerCurrentPosition[player-1].count != 3 { print("새로운 말을 움직이시려면 0을 입력해주세요. : ", terminator: "")}
                guard let choosedMal = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!) else {
                    fatalError("Bad Input")
                }
                var by: Int
                switch currentMove {
                case "빽도": by = -1
                case "도": by = 1
                case "개": by = 2
                case "걸": by = 3
                case "윷": by = 4
                case "모": by = 5
                default: by = 0
                }
                if choosedMal == 0 {
                    //                    isPlayerGallin[player-1].append(false)
                    playerCurrentPosition[player-1].append(Position(y: -1, x: -1))
                    playerCurrentPosition[player-1][playerCurrentPosition[player-1].count-1] = moveMal(from: playerCurrentPosition[player-1][playerCurrentPosition[player-1].count-1], by: by, player: player, targetMal: playerCurrentPosition[player-1].count-1)
//                    yutBoard[playerCurrentPosition[player-1][playerCurrentPosition[player-1].count-1].y][playerCurrentPosition[player-1][playerCurrentPosition[player-1].count-1].x] = playerMalColor[player-1]
//                    yutBoard = reloadYutBoard(playerCurrentPosition, which: player)
                } else {
                    playerCurrentPosition[player-1][choosedMal-1] = moveMal(from: playerCurrentPosition[player-1][choosedMal-1], by: by, player: player, targetMal: choosedMal-1)
//                    yutBoard = reloadYutBoard(playerCurrentPosition, which: 3, currentYutBoard: yutBoard)
                }
                yutBoard = reloadYutBoard(playerCurrentPosition, which: player+2)
                if stackedYut[player-1].count != 0 {printYutBoard(yutBoard)}
                var otherPlayer = 0
                if player == 1 { otherPlayer = 2 }
                else { otherPlayer = 1 }
                if isCaptured(otherPlayer,playerCurrentPosition).contains(true) {
                    sequence1(player, yutBoard)
                    whosLast = player
                    yutBoard = reloadYutBoard(playerCurrentPosition, which: player+2)
                }
                if isCaptured(otherPlayer,playerCurrentPosition).contains(true) { // 1P가 2P의 말을 잡았을 때 -> 1P 먼저 시작
                    sequence1(player, yutBoard)
                    whosLast = player
                    yutBoard = reloadYutBoard(playerCurrentPosition, which: player+2)
                }
                if isCaptured(otherPlayer,playerCurrentPosition).contains(true) { // 1P가 2P의 말을 잡았을 때 -> 1P 먼저 시작
                    sequence1(player, yutBoard)
                    whosLast = player
                    yutBoard = reloadYutBoard(playerCurrentPosition, which: player+2)
                }
            }
            
        default: howManyMove = 0
        }
        return howManyMove
        
    }
    
    private mutating func moveMal(from origin: Position, by moveto: Int, player: Int, targetMal: Int) -> Position {
        let currentPosition = origin
//        self.previousPosition[player-1][targetMal] = origin
        if isNotStarted(position: currentPosition) {
            isFromFirstIntersection[player-1][targetMal] = 0
            isComingBack[player-1][targetMal] = false
            if moveto == -1 {return Position(y: -1, x: -1)}
            else {return Position(y: 10 - 2*moveto, x: 15)}
        } else if isInIntersection(position: currentPosition){
            if currentPosition.x == 15 && currentPosition.y == 0 && moveto != 0 { // 우측 상단 분기점에 위치했을 경우,
                self.isComingBack[player-1][targetMal] = true
                print("안쪽으로 들어가려면 1을, 바깥쪽을 돌려면 2를 입력해주세요. ",terminator: "")
                guard let input = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!) else {
                    return Position(y:-1,x:-1)
                }
                if input == 1 {
                    isFromFirstIntersection[player-1][targetMal] = 1
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
            } else if currentPosition.x == 0 && currentPosition.y == 0 && moveto != 0 { // 좌측 상단 분기점에 위치했을 경우,
                isFromFirstIntersection[player-1][targetMal] = 0
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
                   (currentPosition.y == 8 && currentPosition.x == 3)) && isFromFirstIntersection[player-1][targetMal] == 1 && moveto != 0 {
            self.isComingBack[player-1][targetMal] = true
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
                    self.isComingBack[player-1][targetMal] = true
                    switch moveto {
                    case -1: return Position(y: 4, x: 9)
                    case 1: return Position(y: 6, x: 9)
                    case 2: return Position(y: 8, x: 12)
                    case 3: return Position(y: 10, x: 15)
                    default:
                        print("\(player)P의 말 \(countGallInMal(player))개가 들어왔습니다.")
                        return Position(y: 100, x: 100)
                    }
                } else {
                    self.isComingBack[player-1][targetMal] = true
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
                   (currentPosition.y == 8 && currentPosition.x == 12)) && isFromFirstIntersection[player-1][targetMal] == 0 && moveto != 0 {
            self.isComingBack[player-1][targetMal] = true
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
                    print("\(player)P의 말 \(countGallInMal(player))개가 들어왔습니다.")
                    return Position(y: 100, x: 100)
                }
            case (5,8):
                switch moveto {
                case -1: return Position(y: 4, x: 6)
                case 1: return Position(y: 6, x: 9)
                case 2: return Position(y: 8, x: 12)
                case 3: return Position(y: 10, x: 15)
                default:
                    print("\(player)P의 말 \(countGallInMal(player))개가 들어왔습니다.")
                    return Position(y: 100, x: 100)
                }
            case (6,9):
                switch moveto {
                case -1: return Position(y: 5, x: 8)
                case 1: return Position(y: 8, x: 12)
                case 2: return Position(y: 10, x: 15)
                default:
                    print("\(player)P의 말 \(countGallInMal(player))개가 들어왔습니다.")
                    return Position(y: 100, x: 100)
                }
            case (8,12):
                switch moveto {
                case -1: return Position(y: 6, x: 9)
                case 1: return Position(y: 10, x: 15)
                default:
                    print("\(player)P의 말 \(countGallInMal(player))개가 들어왔습니다.")
                    return Position(y: 100, x: 100)
                }
            default: return Position(y: -1, x: -1)
            }
        } else if isRight(position: currentPosition){
            if isStartingPoint(position: currentPosition) && moveto == -1 { //도 -> 빽도 -> 빽도로 골인하는 경우
                print("\(player)P의 말 \(countGallInMal(player))개가 들어왔습니다.")
                return Position(y: 100, x: 100)
            } else if isStartingPoint(position: currentPosition) && isComingBack[player-1][targetMal] && moveto >= 1 {
                print("\(player)P의 말 \(countGallInMal(player))개가 들어왔습니다.")
                return Position(y: 100, x: 100)
            }
            isComingBack[player-1][targetMal] = false
            let movedPositionY = currentPosition.y - 2*moveto
            switch movedPositionY {
            case ..<0:
                return Position(y: 0, x:currentPosition.x - 3*(moveto-currentPosition.y/2))
            default:
                return Position(y: movedPositionY, x:currentPosition.x)
            }
        } else if isTop(position: currentPosition) {
            isComingBack[player-1][targetMal] = false
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
            isComingBack[player-1][targetMal] = true
            let movedPositionX = currentPosition.x + 3*moveto
            switch movedPositionX {
            case 16...:
                isComingBack[player-1][targetMal] = true
                print("\(player)P의 말 \(countGallInMal(player))개가 들어왔습니다.")
                return Position(y: 100, x: 100)
            default:
                return Position(y: currentPosition.y, x: movedPositionX)
            }
        }
        return Position(y: -1, x: -1)
    }
    
    private func treatYutOrMo(target: [String], player: Int) -> [String] {
        var target = target
        if target.count >= 3 {return target}
        if target[0] == "윷" {
            print("윷이 나왔으므로 \(player)P가 한 번 더 던지겠습니다..")
            let probabilityInYut = [0,0,0,0,1,1,1,1,1,1]
            let yut1 = probabilityInYut.randomElement()!
            let yut2 = probabilityInYut.randomElement()!
            let yut3 = probabilityInYut.randomElement()!
            let backYut = probabilityInYut.randomElement()!
            let sum = yut1 + yut2 + yut3 + backYut
            switch sum {
            case 1:
                if backYut == 1 {
                    target.insert("빽도", at: 0)
                    print("빽도!")
                } else {
                    target.insert("도", at: 0)
                    print("도!")
                }
                printYut(yut1, yut2, yut3, backYut)
            case 2:
                target.insert("개", at: 0)
                print("개!")
                printYut(yut1, yut2, yut3, backYut)
            case 3:
                target.insert("걸", at: 0)
                print("걸!")
                printYut(yut1, yut2, yut3, backYut)
            case 4:
                target.insert("윷", at: 0)
                print("윷!")
                printYut(yut1, yut2, yut3, backYut)
                target = treatYutOrMo( target: target, player: player)
            case 5:
                target.insert("모", at: 0)
                print("모!")
                printYut(yut1, yut2, yut3, backYut)
                target = treatYutOrMo(target: target, player: player)
                
            default:
                return target
            }
            
            
        } else if target[0] == "모" {
            print("모가 나왔으므로 \(player)P가 한 번 더 던지겠습니다..")
            let probabilityInYut = [0,0,0,0,1,1,1,1,1,1]
            let yut1 = probabilityInYut.randomElement()!
            let yut2 = probabilityInYut.randomElement()!
            let yut3 = probabilityInYut.randomElement()!
            let backYut = probabilityInYut.randomElement()!
            let sum = yut1 + yut2 + yut3 + backYut
            switch sum {
            case 1:
                if backYut == 1 {
                    target.insert("빽도", at: 0)
                    print("빽도!")
                } else {
                    target.insert("도", at: 0)
                    print("도!")
                }
                printYut(yut1, yut2, yut3, backYut)
            case 2:
                target.insert("개", at: 0)
                print("개!")
                printYut(yut1, yut2, yut3, backYut)
            case 3:
                target.insert("걸", at: 0)
                print("걸!")
                printYut(yut1, yut2, yut3, backYut)
            case 4:
                target.insert("윷", at: 0)
                print("윷!")
                printYut(yut1, yut2, yut3, backYut)
                target = treatYutOrMo( target: target, player: player)
            case 5:
                target.insert("모", at: 0)
                print("모!")
                printYut(yut1, yut2, yut3, backYut)
                target = treatYutOrMo(target: target, player: player)
            default:
                return target
            }
        }
        return target
    }
    
    private func countGallInMal(_ player: Int) -> Int {
        var count = 0
        for i in self.playerCurrentPosition[player-1] {
            if i.x == 100 {
                count += 1
            }
        }
        return count + 1
    }
    
    private mutating func sequence1(_ player: Int, _ yutBoard: [[String]] ) {
        // 1P가 2P의 말을 잡았을 때 -> 1P 먼저 시작
        var otherPlayer = 0
        if player == 1 {
            otherPlayer = 2
        } else {
            otherPlayer = 1
        }
        var yutBoard = yutBoard
        let capturedIndex = isCaptured(otherPlayer,playerCurrentPosition).firstIndex(of: true)
        self.playerCurrentPosition[otherPlayer-1].remove(at: capturedIndex!)
        self.isComingBack[otherPlayer-1][capturedIndex!] = false
        yutBoard = reloadYutBoard(playerCurrentPosition, which: otherPlayer)
        print("\(player)P가 \(otherPlayer)P의 말을 잡았으므로, \(player)P가 다시 윷을 던집니다.")
        let currentMove = throwYut(player: player, currentYutBoard: yutBoard)
        var currentMal = 0
        if playerCurrentPosition[player-1].count < 3 && playerCurrentPosition[player-1].count != 0 && currentMove != 0 {
            print("새로운 말을 움직이겠습니까? (y/n) ",terminator: "")
            var answer = "n"
            if let typed = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines) {
                answer = typed
            }
            if answer == "y" {
                playerCurrentPosition[player-1].append(Position(y: -1, x: -1))
                currentMal = playerCurrentPosition[player-1].count - 1
                
            } else if answer == "n" {
                if playerCurrentPosition[player-1].count == 1 {
                    currentMal = 0
                } else {
                    for (index, position) in playerCurrentPosition[player-1].enumerated() {
                        if position.x == 100 {
                            print("\(index + 1) : ( 완주 )")
                        } else {
                            print("\(index + 1) : (\(position.x) , \(position.y))")
                        }
                    }
                    print("몇번째 말을 움직이시겠습니까? 1, 2 중에 선택해주세요 : ", terminator: "")
                    guard let choosedMal = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!) else {
                        fatalError("Bad Input")
                    }
                    //                                while choosedMal != 1 || choosedMal != 2 {
                    //                                    print("1, 2 중에 선택해주세요.")
                    //                                    guard let choosedMal = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!) else {
                    //                                        fatalError("Bad Input")
                    //                                    }
                    //                                }
                    currentMal = choosedMal-1
                }
            }
            
        } else if playerCurrentPosition[player-1].count == 3 && currentMove != 0{
            for (index, position) in playerCurrentPosition[player-1].enumerated() {
                if position.x == 100 {
                    print("\(index + 1) : ( 완주 )")
                } else {
                    print("\(index + 1) : (\(position.x) , \(position.y))")
                }
            }
            print("몇번째 말을 움직이시겠습니까? 1, 2, 3 중에 선택해주세요 : ", terminator: "")
            guard let choosedMal = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!) else {
                fatalError("Bad Input")
            }
            //                        while choosedMal != 1 || choosedMal != 2 || choosedMal != 3{
            //                            print("1, 2, 3 중에 선택해주세요.")
            //                            guard let choosedMal = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!) else {
            //                                fatalError("Bad Input")
            //                            }
            //                        }
            currentMal = choosedMal - 1
            
        } else if playerCurrentPosition[player-1].count == 0 && currentMove != 0 {
            playerCurrentPosition[player-1].append(Position(y: -1, x: -1))
            currentMal = 0
        }
        //                    self.playerCurrentPosition[1-1][currentMal] =
        //                        moveMal(from: playerCurrentPosition[1-1][currentMal], by: currentMove, player: 1, targetMal: currentMal)
        if playerCurrentPosition[player-1].count == 0 {playerCurrentPosition[player-1].append(Position(y: -1, x: -1))}
        if playerCurrentPosition[player-1][currentMal].x == -1 && currentMove == -1{ //출발 안했는데 빽도가 나온 경우
            print("출발하지 않았기 때문에 이 말을 지정할 수 없습니다.")
            yutBoard = reloadYutBoard(playerCurrentPosition, which: player+2)
            printYutBoard(yutBoard)
        } else {
            if isAllMalsGallin(player: player, playerCurrentPosition: self.playerCurrentPosition) {
                printWinner(player: player)
                return
            } else {
                if currentMove != 0 {
                    let previousPosition = playerCurrentPosition[player-1][currentMal]
                    playerCurrentPosition[player-1][currentMal] = moveMal(from: playerCurrentPosition[player-1][currentMal], by: currentMove, player: player, targetMal: currentMal)
                    if playerCurrentPosition[player-1][currentMal].x == 100 {
                        yutBoard[previousPosition.y][previousPosition.x] = "⚪️"
                    } else {
//                        yutBoard[playerCurrentPosition[player-1][currentMal].y][playerCurrentPosition[player-1][currentMal].x] = playerMalColor[player-1]
                        yutBoard = reloadYutBoard(playerCurrentPosition, which: player)
                    }
                }
                yutBoard = reloadYutBoard(playerCurrentPosition, which: player + 2)
                printYutBoard(yutBoard)
                
            }
        }
        if isAllMalsGallin(player: player, playerCurrentPosition: playerCurrentPosition) {
            printWinner(player: player)
        }
    }
    
    private mutating func sequence2(_ player: Int, _ yutBoard: [[String]]) {
        var yutBoard = yutBoard
        var otherplayer: Int
        if player == 1 {
            otherplayer = 2
        } else {otherplayer = 1}
        let currentMove = throwYut(player: player, currentYutBoard: yutBoard)
        var currentMal = 0
        yutBoard = reloadYutBoard(playerCurrentPosition, which: otherplayer)
        if playerCurrentPosition[player-1].count != 3 && playerCurrentPosition[player-1].count != 0 && currentMove != 0{
            print("새로운 말을 움직이겠습니까? (y/n) ",terminator: "")
            var answer = "n"
            
            if let typed = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines) {
                answer = typed
            }
            if answer == "y" {
                playerCurrentPosition[player-1].append(Position(y: -1, x: -1))
                currentMal = playerCurrentPosition[player-1].count - 1
            } else if answer == "n" {
                if playerCurrentPosition[player-1].count == 1 {
                    currentMal = 0
                } else {
                    for (index, position) in playerCurrentPosition[player-1].enumerated() {
                        if position.x == 100 {
                            print("\(index + 1) : ( 완주 )")
                        } else {
                            print("\(index + 1) : (\(position.x) , \(position.y))")
                        }
                    }
                    print("몇번째 말을 움직이시겠습니까? 1, 2 중에 선택해주세요 : ", terminator: "")
                    guard let choosedMal = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!) else {
                        fatalError("Bad Input")
                    }
                    //                                while choosedMal != 1 || choosedMal != 2 {
                    //                                    print("1, 2 중에 선택해주세요.")
                    //                                    guard let choosedMal = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!) else {
                    //                                        fatalError("Bad Input")
                    //                                    }
                    //                                }
                    currentMal = choosedMal-1
                }
            }
            
        } else if playerCurrentPosition[player-1].count == 3 && currentMove != 0{
            for (index, position) in playerCurrentPosition[player-1].enumerated() {
                if position.x == 100 {
                    print("\(index + 1) : ( 완주 )")
                } else {
                    print("\(index + 1) : (\(position.x) , \(position.y))")
                }
            }
            print("몇번째 말을 움직이시겠습니까? 1, 2, 3 중에 선택해주세요 : ", terminator: "")
            guard let choosedMal = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!) else {
                fatalError("Bad Input")
            }
            //                        while choosedMal != 1 || choosedMal != 2 || choosedMal != 3{
            //                            print("1, 2, 3 중에 선택해주세요.")
            //                            guard let choosedMal = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!) else {
            //                                fatalError("Bad Input")
            //                            }
            //                        }
            currentMal = choosedMal - 1
            
        } else if playerCurrentPosition[player-1].count == 0 && currentMove != 0 {
            playerCurrentPosition[player-1].append(Position(y: -1, x: -1))
            currentMal = 0
        }
        if playerCurrentPosition[player-1].count == 0 {playerCurrentPosition[player-1].append(Position(y: -1, x: -1))}
        if playerCurrentPosition[player-1][currentMal].x == -1 && currentMove == -1{ //출발 안했는데 빽도가 나온 경우
            print("출발하지 않았기 때문에 이 말을 지정할 수 없습니다.")
            yutBoard = reloadYutBoard(playerCurrentPosition, which: player+2)
            printYutBoard(yutBoard)
        } else {
            if isAllMalsGallin(player: player, playerCurrentPosition: self.playerCurrentPosition) {
                printWinner(player: player)
                return
            } else {
                if currentMove != 0 {
                    let previousPosition = playerCurrentPosition[player-1][currentMal]
                    playerCurrentPosition[player-1][currentMal] = moveMal(from: playerCurrentPosition[player-1][currentMal], by: currentMove, player: player, targetMal: currentMal)
                    if playerCurrentPosition[player-1][currentMal].x == 100 {
                        yutBoard[previousPosition.y][previousPosition.x] = "⚪️"
                    } else {
                        yutBoard = reloadYutBoard(playerCurrentPosition, which: player)
//                        yutBoard[playerCurrentPosition[player-1][currentMal].y][playerCurrentPosition[player-1][currentMal].x] = playerMalColor[player-1]
                    }
                }
                yutBoard = reloadYutBoard(playerCurrentPosition, which: player+2)
                printYutBoard(yutBoard)
            }
        }
        if isAllMalsGallin(player: player, playerCurrentPosition: playerCurrentPosition) {
            printWinner(player: player)
        }
    }
    
    private func reloadYutBoard(_ P: [[Position]], which player: Int) -> [[String]] {
        var yutBoard = self.yutBoard
        switch player {
        case 1:
            for malNumber in 0..<P[1-1].count {
            if P[1-1][malNumber].x != -1 && P[1-1][malNumber].x != 100 {
                yutBoard[P[1-1][malNumber].y][P[1-1][malNumber].x] = playerMalColor[1-1]
                }
            }
        case 2:
            for malNumber in 0..<P[2-1].count {
                if P[2-1][malNumber].x != -1 && P[2-1][malNumber].x != 100 {
                    yutBoard[P[2-1][malNumber].y][P[2-1][malNumber].x] = playerMalColor[2-1]
                }
            }
        case 4:
            for malNumber in 0..<P[1-1].count {
                if P[1-1][malNumber].x != -1 && P[1-1][malNumber].x != 100 {
                    yutBoard[P[1-1][malNumber].y][P[1-1][malNumber].x] = playerMalColor[1-1]
                }
            }
            for malNumber in 0..<P[2-1].count {
                if P[2-1][malNumber].x != -1 && P[2-1][malNumber].x != 100 {
                    yutBoard[P[2-1][malNumber].y][P[2-1][malNumber].x] = playerMalColor[2-1]
                }
            }
        case 3:
            for malNumber in 0..<P[2-1].count {
                if P[2-1][malNumber].x != -1 && P[2-1][malNumber].x != 100 {
                    yutBoard[P[2-1][malNumber].y][P[2-1][malNumber].x] = playerMalColor[2-1]
                }
            }
            for malNumber in 0..<P[1-1].count {
                if P[1-1][malNumber].x != -1 && P[1-1][malNumber].x != 100 {
                    yutBoard[P[1-1][malNumber].y][P[1-1][malNumber].x] = playerMalColor[1-1]
                }
            }
        default: return yutBoard
        }
        return yutBoard
        
    }

    private func checkCapturedMal() {
        //말이 잡혔을 때 진행되는 메소드 구현 예정
    }
}

