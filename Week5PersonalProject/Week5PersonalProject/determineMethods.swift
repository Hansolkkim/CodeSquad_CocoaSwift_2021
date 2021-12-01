//
//  determineMethods.swift
//  Week5PersonalProject
//
//  Created by 김한솔 on 2021/12/01.
//

import Foundation

func isRight(position: Position) -> Bool { //말의 위치가 윷판의 오른쪽편에 있는지?
    if position.x == 15 {return true}
    return false
}
func isLeft(position: Position) -> Bool { //말의 위치가 윷판의 왼쪽편에 있는지?
    if position.x == 0 {return true}
    return false
}
func isInIntersection(position: Position) -> Bool { //말의 위치가 윷판의 분기점에 있는지?
    if (position.x == 15 && position.y == 0) || (position.x == 0 && position.y == 0) {
        return true
    }
    return false
}
func isTop(position: Position) -> Bool { //말의 위치가 윷판의 윗편에 있는지?
    if position.y == 0 {return true}
    return false
}
func isBottom(position: Position) -> Bool { //말의 위치가 윷판의 아랫편에 있는지?
    if position.y == 10 {return true}
    return false
}
func isStartingPoint(position: Position) -> Bool { // 말의 위치가 시작점에 있는지?
    if position.x == 15 && position.y == 10 {return true}
    return false
}
func isNotStarted(position: Position) -> Bool { //말이 출발하기 전인지?
    if position.x == -1 && position.y == -1 {return true}
    return false
}

func isCaptured(_ player: Int, _ playerCurrentPosition: [[Position]]) -> [Bool] {
    var capturedBoolArray = [false, false, false]
    for (index1,position1) in playerCurrentPosition[1-1].enumerated() {
        for (index2,position2) in playerCurrentPosition[2-1].enumerated() {
            if position1.x != -1 && position2.x != -1 && position1.x != 100 && position2.x != 100 {
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
func isAllMalsGallin(player: Int, playerCurrentPosition: [[Position]]) -> Bool {
    var count = 0
    for i in playerCurrentPosition[player - 1] {
        if i.x == 100 {
            count += 1
        }
    }
    return count == 3
}
