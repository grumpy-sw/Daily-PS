//
//  Baekjoon4673.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/23.
//

import Foundation

final class Baekjoon4673 {
    func run() {
        solution()
    }
    
    func solution() {
        for num in 1..<10000 {
            if !hasInitialNumber(num) {
                print(num)
            }
        }
        
    }
    
    func hasInitialNumber(_ num: Int) -> Bool {
        var start = 1
        if num > 50 {
            start = num - 50
        }
        for n in start..<num {
            let unitsOfNum: [Int] = Array(String(n)).map{ String($0) }.map { Int($0)! }
            let sum = unitsOfNum.reduce(0, +) + n
            if sum == num {
                return true
            }
        }
        return false
    }
}
