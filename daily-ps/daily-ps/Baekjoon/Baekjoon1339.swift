//
//  Baekjoon1339.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/13.
//

import Foundation

final class Baekjoon1339 {
    func run() {
        print(solution())
    }
    
    func solution() -> Int {
        var numberPool: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        let count = Int(readLine()!)!
        var coefficients: [String: Int] = [:]
        
        for _ in 0..<count {
            let word = Array(readLine()!)
            
            for index in 0..<word.count {
                let degree = Double(word.count - index - 1)
                let coefficientFromInput = Int(pow(10, degree))
                let coefficientFromDictionary = coefficients[String(word[index])] ?? 0
                coefficients.updateValue(coefficientFromDictionary + coefficientFromInput, forKey: String(word[index]))
            }
        }
        
        let sorted = coefficients.sorted { before, after in
            return before.value > after.value
        }
        
        var result: Int = 0
        
        sorted.forEach {
            let coefficient = $0.value
            result += coefficient * numberPool.removeLast()
        }
        return result
    }
}
