//
//  Baekjoon1759.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/01.
//

import Foundation

final class Baekjoon1759 {
    let vowels: [String] = ["a", "e", "i", "o", "u"]
    var result: [String] = []
    func run() {
        
        let length = readLine()!.split(separator: " ").map{ Int($0)! }[0]
        
        let characters: [String] = readLine()!.split(separator: " ").map{ String($0) }.sorted()
        
        result = combination(characters, count: length)
        result.forEach {
            print($0)
        }
    }
    
    func checkCodeRule(_ code: String) -> Bool {
        var vowelsCount = 0
        for index in 0..<code.count {
            let char = code[code.index(code.startIndex, offsetBy: index)]
            if vowels.contains(String(char)) {
                vowelsCount += 1
            }
        }
        let consonantsCount = code.count - vowelsCount
        
        if consonantsCount < 2 || vowelsCount < 1 {
            return false
        }
        return true
    }
    
    func combination(_ array: [String], count: Int) -> [String] {
        var result = [String]()
        
        if array.count < count { return result }
        
        func pick(_ now: [String], offset: Int) {
            if now.count == count {
                let code = now.joined()
                if checkCodeRule(code) {
                    result.append(code)
                }
                return
            }
            
            for index in offset..<array.count {
                pick(now + [array[index]], offset: index+1)
            }
        }
        
        pick([], offset: 0)
        return result
    }
}
