//
//  Baekjoon10951.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/23.
//

import Foundation

final class Baekjoon10951 {
    func run() {
        solution()
    }
    
    func solution() {
        var cases: [[Int]] = []
        while true {
            guard let input = readLine() else {
                break
            }
            let numbers = input.split(separator: " ").map{ Int($0)! }
            cases.append(numbers)
        }
        
        for index in 0..<cases.count {
            print(cases[index][0] + cases[index][1])
        }
    }
}
