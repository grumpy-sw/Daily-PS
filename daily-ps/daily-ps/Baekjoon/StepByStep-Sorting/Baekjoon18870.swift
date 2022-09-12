//
//  Baekjoon18870.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/12.
//

import Foundation

final class Baekjoon18870 {
    func run() {
        _ = Int(readLine()!)!
        let numbers: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
        var matcher: [Int: Int] = [:]
        let sorted = removeDuplicateWord(numbers).sorted()
        
        for index in 0..<sorted.count {
            matcher.updateValue(index, forKey: sorted[index])
        }
        
        numbers.forEach {
            print(matcher[$0]!, terminator: " ")
        }
        
    }
    
    func removeDuplicateWord(_ words: [Int]) -> [Int] {
        let set = Set(words)
        return Array(set)
    }
}
