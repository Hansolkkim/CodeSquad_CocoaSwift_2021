//
//  PairingBracket.swift
//  Week3WedExercise
//
//  Created by 김한솔 on 2021/11/17.
//
import Foundation

enum Bracket {
    case round
    case square
    case curly
}

struct PairingBracket {
    let openBracket: String
    let closingBracket: String
    var wholeBracketArray = [String]()
    init(with shapeOfBracet: Bracket) {
        switch shapeOfBracet {
        case .round:
            self.openBracket = "("
            self.closingBracket = ")"
        case .square:
            self.openBracket = "["
            self.closingBracket = "]"
        case .curly:
            self.openBracket = "{"
            self.closingBracket = "}"
        }
    }
    var count: Int!
    var bracketArray: String {
        get {
            return String(repeating: String(openBracket), count: count) + String(repeating: String(closingBracket), count: count)
        }
    }
    //    mutating func calculateNumberOfBracketPair(_ count: Int) -> Int{
    //        if count == 0 {
    //            return 1
    //        }
    //
    //        for i in 0...count-1 {
    //            self.sum += calculateNumberOfBracketPair(count-1-i) * calculateNumberOfBracketPair(i)
    //        }
    //        return self.sum
    //    }
    func swap(_ a: Int, _ b: Int, _ Str: String) -> String {
        var str = Str.map{String($0)}
        let tmp = str[a]
        str[a] = str[b]
        str[b] = tmp
        return str.reduce("", +)
    }

   
    mutating func generate(with count: Int) -> Array<String> {
        self.count = count
        var result = [String]()
        func permutation(_ a: String, _ n: Int) {
            if n == 0 {
                self.wholeBracketArray.append(a)
            } else {
                var a = a
                permutation(a, n-1)
                for i in 0..<n {
                    a = swap(i, n, a)
                    permutation(a, n-1)
                    a = swap(i, n, a)
                }
            }
        }
        permutation(self.bracketArray, count)
        var wholeBracketArray = self.wholeBracketArray
        
        for i in 0..<wholeBracketArray.count {
            var stack: [String] = []
            while wholeBracketArray[i].isEmpty == false {
                let digit = String(wholeBracketArray[i].removeFirst())
                if stack.isEmpty {
                    stack.append(digit)
                } else if stack.last! == openBracket && digit == closingBracket{
                    stack.removeLast()
                } else { stack.append(digit)}
            }
            if stack.isEmpty && !result.contains(self.wholeBracketArray[i]) { result.append(self.wholeBracketArray[i]) }
        }
        
        return result
    }
    
    func analyze(with value: String) -> Bool {
        var value = value
        var stack: [String] = []
        while value.isEmpty == false {
            let digit = String(value.removeFirst())
            if stack.isEmpty {
                stack.append(digit)
            } else if stack.last! == openBracket && digit == closingBracket {
                stack.removeLast()
            } else { stack.append(digit) }
        }
        return stack.isEmpty
    }
}
