//
//  Baekjoon2108.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/07.
//

import Foundation

final class Baekjoon2108 {
    func run() {
        solution()
    }
    
    func solution() {
        
        let N = Int(readLine()!)!
        var numbers = [Int]()
        var counts: [Int: Int] = [:]
        for _ in 0..<N {
            let num = Int(readLine()!)!
            numbers.append(num)
            counts[num, default: 0] += 1
        }
        
        let sortedNumbers = numbers.sorted()
        print(Int(round(Double(sortedNumbers.reduce(0, +)) / Double(N))))
        print(sortedNumbers[N / 2])
        print(findMode(counts))
        print(sortedNumbers.last! - sortedNumbers.first!)
        
    }
    
    func findMode(_ counts: [Int: Int]) -> Int {
        let maxValue = counts.max(by: {
            $0.value < $1.value
        })!.value
        
        var mode = counts.filter { $0.value == maxValue }.keys.sorted()
        
        if mode.count > 1 {
            return mode[1]
        } else {
            return mode[0]
        }
        
    }
}
