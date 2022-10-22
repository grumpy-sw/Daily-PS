//
//  TakeTwoAndAdd.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/10/22.
//

// Level 1. 월간 코드 챌린지 시즌 1. 두 개 뽑아서 더하기
import Foundation

final class TakeTwoAndAdd {
    func run() {
        print(solution([2,1,3,4,1]))
    }
    
    func solution(_ numbers:[Int]) -> [Int] {
        return sumSet(combination(2, numbers)).sorted()
    }
    
    func combination(_ n: Int, _ numbers: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        
        func pick(_ offset: Int, _ now: [Int]) {
            if now.count == n {
                result.append(now)
                return
            }
            
            for index in offset..<numbers.count {
                pick(index + 1, now + [numbers[index]])
            }
        }
        pick(0, [])
        return result
    }
    
    func sumSet(_ numbers: [[Int]]) -> [Int] {
        var sumArray: [Int] = []
        numbers.forEach {
            sumArray.append($0.reduce(0, +))
        }
        
        return Array(Set(sumArray))
    }
}
