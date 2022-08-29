//
//  Baekjoon2908.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/29.
//

import Foundation

final class Baekjoon2908 {
    func run() {
        solution()
    }
    
    func solution() {
        var numbers = readLine()!.split(separator: " ").map { Int($0)! }
        let left = String(numbers[0]).reversed().map{ String($0) }.joined()
        let right = String(numbers[1]).reversed().map{ String($0) }.joined()
        
        numbers[0] = Int(left)!
        numbers[1] = Int(right)!
        
        if numbers[0] > numbers[1] {
            print(numbers[0])
        } else {
            print(numbers[1])
        }
    }
}
