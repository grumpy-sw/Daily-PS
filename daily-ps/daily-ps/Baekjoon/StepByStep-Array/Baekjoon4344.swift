//
//  Baekjoon4344.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/23.
//

import Foundation

final class Baekjoon4344 {
    func run() {
        solution()
    }
    
    func solution() {
        let n = Int(readLine()!)!
        
        for _ in 0..<n {
            var numbers = readLine()!.split(separator: " ").map { Double($0)! }
            let students = numbers.removeFirst()
            
            let overall = overallValue(numbers)
            let portion = Double(numbers.filter {
                $0 > overall
            }.count) / Double(students)
            
            let digit: Double = pow(10, 5)
            let result = round(portion * digit) / digit * 100
            print(String(format: "%.3f", result) + "%")
        }
    }
    
    func overallValue(_ numbers: [Double]) -> Double {
        var sum: Double = 0.0
        numbers.forEach {
            sum += $0
        }
        return sum / Double(numbers.count)
    }
}
