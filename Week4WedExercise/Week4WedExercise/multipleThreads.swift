//
//  multipleThreads.swift
//  Week4WedExercise
//
//  Created by 김한솔 on 2021/11/24.
//

import Foundation
class BackgroundWork {

    var thread : Thread? = nil
    let words = ["대중", "경제", "재산", "자유", "국제",
                 "시장", "사상", "부자", "학자", "개인",
                 "욕망", "생활", "자원", "사람", "노동",
                 "인물", "소비", "사회", "이론", "새로운"]

    func doTimeConsumingOperation(_ str: String) {
        thread = Thread(target: self, selector: #selector(BackgroundWork.countWord(_:)), object: str)
        thread?.start()
    }

    @objc func countWord(_ str: String) {
        autoreleasepool { () in
            for word in words {
                print("\(word) : \(str.components(separatedBy: word).count-1)개")
            }
        }
    }
    
}
