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

    func makeLadder(cnt: Int, height: Int)-> [String]{
        
        if errorCode != -1 {
            
            var footholdArr: [[Int]] = [[Int]](repeating: [Int](repeating: 2, count: cnt-1), count: height)
            var ladderArr: [String] = [String](repeating: "", count: height)
            
            for yIndex in 0..<height {
                
                for xIndex in 0..<(cnt-1) {
                    
                    ladderArr[yIndex] += "|"
                    footholdArr[yIndex][xIndex] = Int.random(in: 0...1)
                    
                    if footholdArr[yIndex][xIndex] == 1 {
                        ladderArr[yIndex] += "-"
                    }else {
                        ladderArr[yIndex] += " "
                    }
                    
                }
                
                ladderArr[yIndex] += "|"
            }
            
            return ladderArr
            
        }else {
            return ["---프 로 그 램 종 료---"]
        }
        
    }
}
func printLadder(Ladder: [String],height: Int) {
    for y in Ladder{
        print(y)
    }
}

var someLadder = Ladder()
someLadder.setLadder()
printLadder(Ladder: someLadder.makeLadder(cnt: someLadder.myHeadCount, height: someLadder.myLadderHeight), height: someLadder.myLadderHeight)
