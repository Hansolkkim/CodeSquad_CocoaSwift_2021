//
//  main.swift
//  Week3WedExercise
//
//  Created by κΉνμ on 2021/11/17.
//

import Foundation

var myBracketPair = PairingBracket(with: .round)

print(myBracketPair.generate(with:2))
print(myBracketPair.analyze(with: "((()))"))
