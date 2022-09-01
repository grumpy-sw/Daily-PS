//
//  Baekjoon2869.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/02.
//

import Foundation

final class Baekjoon2869 {
    func run() {
        solution()
    }
    
    func solution() {
        let numbers = readLine()!.split(separator: " ").map { Int($0)! }
        let moveRange = numbers[0]
        let slipRange = numbers[1]
        let height = numbers[2]
        let days: Int = (height - slipRange) / (moveRange - slipRange)
        
        if (height - slipRange) % (moveRange - slipRange) != 0 {
            print(days + 1)
        } else {
            print(days)
        }
    }
}
