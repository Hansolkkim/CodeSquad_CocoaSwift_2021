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
