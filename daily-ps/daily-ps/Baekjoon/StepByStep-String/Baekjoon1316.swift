//
//  Baekjoon1316.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/29.
//

import Foundation

final class Baekjoon1316 {
    func run() {
        solution()
    }
    
    func solution() {
        let n = Int(readLine()!)!
        var words = [String]()
        var count = 0
        
        for _ in 0..<n {
            words.append(readLine()!)
        }
        
        words.forEach {
            if isGroupWord($0) {
                count += 1
            }
        }
        
        print(count)
    }
    
    func isGroupWord(_ word: String) -> Bool {
        let wordArray = Array(compressWord(word)).map{ String($0) }
        let removeDuplicated = removeDuplicatedElements(in: wordArray)
        
        if wordArray.count == removeDuplicated.count {
            return true
        }
        return false
    }
    
    func compressWord(_ word: String) -> String {
        if word.count == 1 {
            return word
        }
        
        var stack: [String] = []
        let wordArray = Array(word).map{ String($0) }
        
        for index in 0..<wordArray.count {
            if stack.isEmpty {
                stack.append(wordArray[index])
            } else {
                let last = stack.last!
                if last != wordArray[index] {
                    stack.append(wordArray[index])
                }
            }
        }
        return stack.joined()
    }
    
    func removeDuplicatedElements(in array: [String]) -> [String] {
        let set: Set = Set(array)
        return Array(set)
    }
}
