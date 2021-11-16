//
//  main.swift
//  Week3TueExcercise
//
//  Created by 김한솔 on 2021/11/16.
//

import Foundation

var myList = LinkedArray()
var someValue = 2
while myList.A.contains(0) { //A는 모든 값이 0으로 초기화됐기 때문에, A에 0이 없을 떄까지 List의 valueArray에 오름차순으로 값을 입력함.
    myList.append(someValue)
    someValue += 1
}

print(myList.A)
myList.enumerateList(myList.A)

print(myList.countOfList(myList.A))
print(myList.isFullList(myList.A))


var myLinkedList = LinkedList()
myLinkedList.append(data: 1)
myLinkedList.insert(data: 7, at: 2)
myLinkedList.append(data: 4)

myLinkedList.printLinkedList()

myLinkedList.removeLast()
myLinkedList.printLinkedList()
