//
//  ThreeMusketeers.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/10/22.
//

// Level 1. 연습문제. 삼총사
import Foundation

final class ThreeMusketeers {
    func run() {
        print(solution([-3, -2, -1, 0, 1, 2, 3]))
    }
    
    func solution(_ number:[Int]) -> Int {
        
        return combination(3, number).count
    }
    
    func combination(_ n: Int, _ numbers: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        
        func pick(_ offset: Int, _ now: [Int]) {
            if now.count == n {
                if now.reduce(0, +) == 0 {
                    result.append(now)
                }
                
                return
            }
            
            for index in offset..<numbers.count {
                pick(index + 1, now + [numbers[index]])
            }
        }
        pick(0, [])
        return result
    }
}
