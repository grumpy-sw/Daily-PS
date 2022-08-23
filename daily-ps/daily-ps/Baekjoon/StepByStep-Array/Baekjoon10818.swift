//
//  Baekjoon10818.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/23.
//

import Foundation

final class Baekjoon10818 {
    func run() {
        solution()
    }
    
    func solution() {
        _ = Int(readLine()!)!
        let numbers = readLine()!.split(separator: " ").map { Int($0)! }
        
        print("\(minElement(numbers)) \(maxElement(numbers))")
    }
    
    func maxElement(_ numbers: [Int]) -> Int {
        var max = -1000000
        for number in numbers {
            if number > max {
                max = number
            }
        }
        return max
    }
    
    func minElement(_ numbers: [Int]) -> Int {
        var min = 1000000
        for number in numbers {
            if number < min {
                min = number
            }
        }
        return min
    }
}
