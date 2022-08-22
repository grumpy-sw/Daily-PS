//
//  Baekjoon2480.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/22.
//

import Foundation

final class Baekjoon2480 {
    func run() {
        solution()
    }
    
    func solution() {
        let numbers = readLine()!.split(separator: " ").map { Int($0)! }
        
        if numbers[0] == numbers[1], numbers[1] == numbers[2] {
            print(10000 + numbers[0] * 1000)
        } else if numbers[0] == numbers[1] || numbers[1] == numbers[2] || numbers[0] == numbers[2] {
            print(1000 + duplicateValue(numbers) * 100)
        }
        else {
            print(maxValue(numbers) * 100)
        }
    }
    
    func maxValue(_ numbers: [Int]) -> Int {
        var max = 0
        
        numbers.forEach {
            if $0 > max {
                max = $0
            }
        }
        
        return max
    }
    
    func duplicateValue(_ numbers: [Int]) -> Int {
        var duplicate = 0
        
        if numbers[0] == numbers[1] {
            duplicate = numbers[0]
        } else if numbers[1] == numbers[2] {
            duplicate = numbers[1]
        } else if numbers[0] == numbers[2] {
            duplicate = numbers[2]
        }
        
        return duplicate
    }
}
