//
//  Baekjoon10430.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/22.
//

import Foundation

final class Baekjoon10430 {
    func run() {
        solution()
    }
    
    func solution() {
        let numbers = readLine()!.split(separator: " ").map { Int($0)! }
        
        let a = numbers[0]
        let b = numbers[1]
        let c = numbers[2]
        
        print((a + b) % c)
        print(((a % c) + (b % c)) % c)
        print((a * b) % c)
        print(((a % c) * (b % c)) % c)
    }
}
