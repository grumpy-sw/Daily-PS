//
//  Baekjoon8958.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/23.
//

import Foundation

final class Baekjoon8958 {
    func run() {
        solution()
    }
    
    func solution() {
        let n = Int(readLine()!)!
        var cases: [[String]] = []
        
        for _ in 0..<n {
            cases.append(Array(readLine()!).map{ String($0) })
        }
        
        for index in 0..<cases.count {
            let front = cases[index]
            var sum: Int = 0
            var score: Int = 0
            
            for index in 0..<front.count {
                let mark = front[index]
                if mark == "O" {
                    score += 1
                    sum += score
                } else {
                    score = 0
                }
            }
            
            print(sum)
        }
    }
}
