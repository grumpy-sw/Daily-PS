//
//  Baekjoon1546.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/23.
//

import Foundation

final class Baekjoon1546 {
    func run() {
        solution()
    }
    
    func solution() {
        _ = Int(readLine()!)!
        
        let numbers = readLine()!.split(separator: " ").map { Double($0)! }
        let maxElement = maxElement(numbers)
        
        let newNumbers = numbers.map { $0/maxElement * 100 }
        print(overallValue(newNumbers))
    }
    
    func maxElement(_ numbers: [Double]) -> Double {
        var max: Double = 0
        
        for number in numbers {
            if number > max {
                max = number
            }
        }
        return max
    }
    
    func overallValue(_ numbers: [Double]) -> Double {
        var sum: Double = 0.0
        numbers.forEach {
            sum += $0
        }
        return sum / Double(numbers.count)
    }
}
