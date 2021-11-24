//
//  CSVFile.swift
//  Week4WedExercise
//
//  Created by 김한솔 on 2021/11/24.
//

import Foundation

class CSV {
    var personalInfo = [Dictionary<String,Any>](repeating: ["name":"", "email":"", "language":"", "grade": 0], count: 4)
    
    init(_ str: String) {
        func getCSVData(_ index: Int) -> Array<String> {
                let content = str
                let parsedCSV: [String] = content.components(
                    separatedBy: "\n"
                ).map{ $0.components(separatedBy: ", ")[index] }
                return parsedCSV
        }
        for index in 0..<4 {
            personalInfo[index].updateValue(getCSVData(0)[index+1], forKey: getCSVData(0)[0])
            personalInfo[index].updateValue(getCSVData(1)[index+1], forKey: getCSVData(1)[0])
            personalInfo[index].updateValue(getCSVData(2)[index+1], forKey: getCSVData(2)[0])
            personalInfo[index].updateValue(Int(getCSVData(3)[index+1])!, forKey: getCSVData(3)[0])
        }
    }
    
    func add(name: String, email: String, language: String, grade: Int) {
        print("\(name)의 데이터가 추가되었습니다.")
        personalInfo.append([
            "name" : name,
            "email" : email,
            "language" : language,
            "grade" : grade
        ])
    }
    
    func findBy(name: String) -> Dictionary<String,Any> {
        var resultDic = Dictionary<String,Any>()
        for i in 0..<personalInfo.count {
            guard let currentName = personalInfo[i]["name"] as? String else { return Dictionary<String,Any>() }
            if currentName == name {
                resultDic = personalInfo[i]
                break
            }
        }
        return resultDic
    }
    
    func removeBy(email: String) -> Bool {
        
        for i in 0..<personalInfo.count {
            guard let currentEmail = personalInfo[i]["email"] as? String else {return false}
            if currentEmail == email {
                print("\(personalInfo[i]["name"]!)의 데이터가 삭제되었습니다.")
                personalInfo.remove(at: i)
                return true
            }
        }
        print("\"\(email)\"의 이메일 주소를 가진 사용자를 찾을 수 없습니다.")
        return false
    }
    
    func write(to file: String) -> Bool {
        let path = "/Users/hansolkim/Documents"
        if isExist(filename: file, at: path) {
            return false
        } else {
            do {
                var csvString = "name, email, language, grade \n"
                for dct in personalInfo {
                    csvString.append("\(dct["name"]!), \(dct["email"]!), \(dct["language"]!), \(dct["grade"]!)\n ")
                }
                let fileManager = FileManager.default
                let path = try fileManager.url(for: .documentDirectory, in: .allDomainsMask, appropriateFor: nil, create: false)
                let fileURL = path.appendingPathComponent(file)
                try csvString.write(to: fileURL, atomically: true, encoding: .utf8)
            } catch {return false}
            return true
        }
    }
}
