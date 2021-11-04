import Foundation

struct Ladder{
    var myHeadCount: (Int) = 0, myLadderHeight: (Int) = 0
    var errorCode: (Int) = 0
    
    mutating func setLadder() {
        print("인원을 입력해주세요.(2~8명) : ", terminator: "")
        let headCount = Int(readLine()!)
        if (headCount! < 2) || (headCount! > 8) {
            print("인원이 너무 적거나 너무 많습니다.")
            errorCode = -1
        }else {
            print("사다리 높이를 입력해주세요 : ", terminator:  "")
            let ladderHeight = Int(readLine()!)
            print("인원 : \(headCount ?? 0), 사다리 높이 : \(ladderHeight ?? 0)")
            myHeadCount = headCount ?? 0
            myLadderHeight = ladderHeight ?? 0
        }
       
        
    }
}

var someLadder = Ladder()
someLadder.setLadder()
