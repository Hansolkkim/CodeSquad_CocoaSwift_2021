//
//  RealLinkedList.swift
//  Week3TueExcercise
//
//  Created by 김한솔 on 2021/11/16.
//

import Foundation

class Node {
    var data: Int
    var next: Node?
    
    init(data: Int, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

class LinkedList {
    private var head: Node?
    
    func append(data: Int) {
        
        if head == nil {
            head = Node(data: data)
            print("List의 head에 \(data)가 입력되었습니다.")
            return
        }
        
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        node?.next = Node(data: data)
        print("List의 맨 뒤에 \(data)가 입력되었습니다.")
    }
    
    func insert(data: Int, at index: Int) {
        if head == nil {
            head = Node(data: data)
            return
        }
        
        var node = head
        for _ in 0..<(index-1) {
            if node?.next == nil {break}
            node = node?.next
        }
        
        let nextNode = node?.next
        node?.next = Node(data: data)
        node?.next?.next = nextNode
        print("List의 index = \(index)에 \(data)가 입력되었습니다.")
    }
    
    func removeLast() {
        if head == nil { return }
        
        if head?.next == nil {
            head = nil
            return
        }
        
        var node = head
        while node?.next?.next != nil {
            node = node?.next
        }
        
        node?.next = node?.next?.next
    }
    
    func remove(at index: Int) {
        
        if head == nil { return }
        
        if index == 0 || head?.next == nil {
            head = head?.next
            return
        }
        
        var node = head
        for _ in 0..<(index - 1) {
            if node?.next?.next == nil {break}
            node = node?.next
        }
        
        node?.next = node?.next?.next
    }
    
    func searchNode(from data: Int) -> Node? {
        
        if head == nil { return nil }
        
        var node = head
        while node?.next != nil {
            if node?.data == data {break}
            node = node?.next
        }
        return node
    }
    
    func printLinkedList() {
        print("연결리스트 출력 : ")
        var current = head
        while current != nil {
            print(current?.data ?? "nil")
            current = current?.next

        }
    }
}
