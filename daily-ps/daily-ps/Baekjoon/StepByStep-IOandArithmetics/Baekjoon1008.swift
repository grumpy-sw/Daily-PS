//
//  Baekjoon1008.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/22.
//

import Foundation

final class Baekjoon1008 {
    func run() {
        solution()
    }
    
    func solution() {
        let numbers = readLine()!.split(separator: " ").map { Double($0)! }
        print(numbers[0] / numbers[1])
    }
}
