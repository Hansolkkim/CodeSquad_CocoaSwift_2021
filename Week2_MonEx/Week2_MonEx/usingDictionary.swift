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
        var outputWords: [String] = [String]()
        
        while myLocation < inputWords.count {

            let myWord = inputWords[myLocation]
            
            if myLocation < inputWords.count-1 { //직전값의 위치가 배열의 맨 끝의 직전까지
                
                for i in myLocation+1...inputWords.count-1 {

                    if myWord == inputWords[i]{ //같은 단어 발견시
                        cnt += 1
                        break
                    }
                }

                if cnt != 1 { //비교가 끝나고, cnt > 0 인 값이 있는 경우
                    var cntSame = 0
                    for alreadyWritten in outputWords { //이미 입력된 단어라면 생략하기 위한 for + if 문
                        if myWord == alreadyWritten {
                            cntSame += 1
                            break
                        }
                    }
                    if cntSame == 0 {
                        outputWords.append(myWord)
                    }
                }
                cnt = 1 //같은 값 갯수 표시하는 변수 초기화
                
            } else { //직전값의 위치가 배열의 맨 끝일 때
                
                if cnt != 1 {
                    
                    var cntSame = 0
                    for alreadyWritten in outputWords {
                        if myWord == alreadyWritten {
                            cntSame += 1
                            break
                        }
                    }
                    if cntSame == 0 {
                        outputWords.append(myWord)
                    }
                }
            }
            myLocation += 1
        }

        return outputWords

    }
}



