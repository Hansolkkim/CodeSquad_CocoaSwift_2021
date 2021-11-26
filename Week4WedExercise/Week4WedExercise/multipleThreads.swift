//
//  multipleThreads.swift
//  Week4WedExercise
//
//  Created by 김한솔 on 2021/11/24.
//

import Foundation
class BackgroundWork {
    let bookStr = try! String(contentsOfFile: "/Users/hansolkim/CodeSquad_CocoaSwift_2021/Week4WedExercise/Week4WedExercise/bookfile.txt")
    var thread : Thread? = nil
    let words = ["대중", "경제", "재산", "자유", "국제",
                 "시장", "사상", "부자", "학자", "개인",
                 "욕망", "생활", "자원", "사람", "노동",
                 "인물", "소비", "사회", "이론", "새로운"]

    func doTimeConsumingOperation() {
        for word in words {
            thread = Thread(target: self, selector: #selector(BackgroundWork.countWord(_:)), object: word)
            thread?.start()
        }
    }

    @objc func countWord(_ word: String) {
        autoreleasepool { () in
                print("\(word) : \(bookStr.components(separatedBy: word).count-1)개")

        }
    }
}
