//
//  main.swift
//  Week3TueExcercise
//
//  Created by 김한솔 on 2021/11/16.
//

import Foundation

var myList = LinkedArray()
var someValue = 2
while myList.A.contains(0) {
    myList.append(someValue)
    someValue += 1
}

print(myList.A)
myList.enumerateList(myList.A)

print(myList.countOfList(myList.A))
print(myList.isFullList(myList.A))
