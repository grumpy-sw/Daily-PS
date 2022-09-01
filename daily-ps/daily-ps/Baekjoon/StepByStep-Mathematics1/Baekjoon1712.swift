//
//  Baekjoon1712.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/01.
//

import Foundation

final class Baekjoon1712 {
    
    func run() {
        solution()
    }
    
    func solution() {
        var result = -1
        let numbers = readLine()!.split(separator: " ").map { Int($0)! }
        let profit = numbers[2] - numbers[1]
        
        if profit > 0 {
            result = (numbers[0] / profit) + 1
        }
        print(result)
    }
}
