//
//  ExploreFileSystem.swift
//  Week4WedExercise
//
//  Created by 김한솔 on 2021/11/24.
//

import Foundation

func files(at path: String) -> [String] {
    let myFileManager = FileManager.default
    do {
        let contents = try myFileManager.contentsOfDirectory(atPath: path).sorted() // 추가기능 1번째 -> 파일명 알파벳 순서대로 정렬하는 메소드 -> sorted()로 알파벳 순으로 정렬
        return contents
    } catch let error as NSError {
        return ["Error access directory : \(error)"]
    }
}

func isExist(filename: String, at path: String) -> Bool {
    return files(at: path).contains(filename)
}

func isExist(filename: [String], at path: String) -> [Bool] { //추가기능 2번째 -> 찾아야 하는 파일이 여러개인 경우를 처리하는 메소드
    var result = [Bool]()
    filename.forEach{ //forEach 구문을 사용해서 2번째 추가기능 해결
        result.append(files(at: path).contains($0))
    }
//    filename.forEach{ //isExist(filename:String,...)함수를 활용하여 2번째 추가기능 해결
//        result.append(isExist(filename: $0, at: path))
//    }
//    for i in filename { //for문으로 2번째 추가기능 해결
//        result.append(files(at: path).contains(i))
//    }
    return result
}

func filesWithSuffix(suffix: String, at path: String) -> [String] { //추가기능 3번째 -> 특정 확장자 파일 목록만 찾는 메소드
    let myFileArray = files(at: path)
    return myFileArray.filter{ // hasSuffix와 filter를 이용해 해결
        $0.hasSuffix(suffix)
    }
}
