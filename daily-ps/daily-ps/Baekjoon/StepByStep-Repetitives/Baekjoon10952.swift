//
//  Baekjoon10952.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/23.
//

import Foundation

final class Baekjoon10952 {
    func run() {
        solution()
    }
    
    func solution() {
        var cases: [[Int]] = []
        while true {
            let numbers = readLine()!.split(separator: " ").map { Int($0)! }
            
            if numbers == [0, 0] {
                break
            }
            
            cases.append(numbers)
        }
        
        for index in 0..<cases.count {
            print(cases[index][0] + cases[index][1])
        }
    }
}
