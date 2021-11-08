//
//  usingDictionary.swift
//  Week2_MonEx
//
//  Created by 김한솔 on 2021/11/08.
//

import Foundation

struct usingDictionary {

    func duplicatedWords(inputWords: Array<String>) -> Array<String> {

        var cnt = 1
        var myLocation = 0
        let sortedInputWords = inputWords.sorted()
        var outputWords: [String] = [String]()

        while myLocation < inputWords.count {

            let myWord = sortedInputWords[myLocation]
            if myLocation < inputWords.count-1 {
                for i in myLocation+1...inputWords.count-1 {

                    if myWord == sortedInputWords[i]{
                        cnt += 1
                    }
                    if (myWord != sortedInputWords[i]) || (myLocation + cnt >= sortedInputWords.count) {

                        if cnt > 1 {
                            outputWords.append(myWord)
                        }
                        myLocation += cnt
                        cnt = 1
                        break
                    }
                }
            } else {
                if cnt != 1 {
                    outputWords.append(myWord)
                    myLocation += 1
                }
                myLocation += 1
            }



        }

        return outputWords

    }
}


