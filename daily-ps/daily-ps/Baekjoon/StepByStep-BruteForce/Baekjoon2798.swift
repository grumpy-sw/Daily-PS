//
//  Baekjoon2798.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/06.
//

import Foundation

final class Baekjoon2798 {
    
    var answer: Int = 0
    var target: Int = 0
    func run() {
        solution()
    }
    
    func solution() {
        let input = readLine()!.split(separator: " ").map{ Int($0)! }
        target = input[1]
        
        let numbers = readLine()!.split(separator: " ").map{ Int($0)! }
        
        combination(numbers, count: 3)
        print(answer)
    }
    
    func combination(_ array: [Int], count: Int) {
        
        guard array.count >= count else { return }
        
        func pick(_ now: [Int], offset: Int) {
            if now.count == count {
                let sum = now.reduce(0, +)
                if sum <= target, sum > answer {
                    answer = sum
                }
                return
            }
            
            for index in offset..<array.count {
                pick(now + [array[index]], offset: index+1)
            }
        }
        
        pick([], offset: 0)
    }
}
