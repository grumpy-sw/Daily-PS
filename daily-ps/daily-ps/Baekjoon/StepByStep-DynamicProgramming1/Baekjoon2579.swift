//
//  Baekjoon2579.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/12/07.
//

import Foundation

final class Baekjoon2579 {
    func run() {
        let n = Int(readLine()!)!
        var steps: [Int] = []
        for _ in 0..<n {
            steps.append(Int(readLine()!)!)
        }
        
        print(solution(n, steps))
    }
    
    func solution(_ n: Int, _ steps: [Int]) -> Int {
        var scores = Array(repeating: 0, count: n)
        
        for index in 0..<n {
            if index == 0 {
                scores[index] = steps[index]
            } else if index == 1 {
                scores[index] = steps[index - 1] + steps[index]
            } else if index == 2 {
                scores[index] = max(steps[index - 1], steps[index - 2]) + steps[index]
            } else {
                scores[index] = max(scores[index - 2], steps[index - 1] + scores[index - 3]) + steps[index]
            }
        }
        
        return scores.last!
    }
}
