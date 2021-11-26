//
//  main.swift
//  Week4WedExercise
//
//  Created by 김한솔 on 2021/11/24.
//

import Foundation

let myPath = "/System/Library/Desktop Pictures"
print(files(at: myPath))

let existFileName = files(at: myPath)
let notExistFileName = ["Hansol.swift", "JK.swift", "jeje.swift", "Tree.heic"]
print(isExist(filename: existFileName[1] , at: myPath))
print(isExist(filename: notExistFileName[0] , at: myPath))

print(isExist(filename: existFileName, at: myPath))
print(isExist(filename: notExistFileName, at: myPath))

print(filesWithSuffix(suffix: ".plist", at: myPath))


let myCSVfile = try String(contentsOfFile: "/Users/hansolkim/CodeSquad_CocoaSwift_2021/Week4WedExercise/Week4WedExercise/sample.csv")

let myCSV = CSV(myCSVfile)
myCSV.add(name: "sol", email: "hskim6521@naver.com", language: "swift", grade: 4)
print(myCSV.findBy(name: "sol"))
myCSV.removeBy(email: "hskim6521@naver.com")
myCSV.removeBy(email: "JK@naver.com")

print(myCSV.write(to: "sample1.csv"))

var myThread = BackgroundWork()
myThread.doTimeConsumingOperation()
RunLoop.current.run()
