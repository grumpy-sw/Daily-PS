//
//  Baekjoon1181.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/12.
//

import Foundation

final class Baekjoon1181 {
    func run() {
        solution()
    }
    
    func solution() {
        let N = Int(readLine()!)!
        var words = [String]()
        
        for _ in 0..<N {
            words.append(readLine()!)
        }
        
        words = removeDuplicateWord(words)
        
        let sorted = words.sorted { word1, word2 in
            if word1.count == word2.count {
                return word1 < word2
            } else {
                return word1.count < word2.count
            }
        }
        
        sorted.forEach {
            print($0)
        }
    }
    
    func removeDuplicateWord(_ words: [String]) -> [String] {
        let set = Set(words)
        return Array(set).map{ String($0) }
    }
}
