//
//  Baekjoon11022.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/23.
//

import Foundation

final class Baekjoon11022 {
    func run() {
        solution()
    }
    
    func solution() {
        let n = Int(readLine()!)!
        var cases: [[Int]] = []
        for _ in 0..<n {
            let numbers = readLine()!.split(separator: " ").map { Int($0)! }
            cases.append(numbers)
        }
        
        for index in 0..<n {
            print("Case #\(index + 1): \(cases[index][0]) + \(cases[index][1]) = \(cases[index].reduce(0, +))")
        }
    }
}
