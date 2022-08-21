//
//  Baekjoon1037.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/22.
//

import Foundation

final class Baekjoon1037 {
    func run() {
        solution()
    }
    
    func solution() {
        let n = Int(readLine()!)!
        let numbers: [Int] = readLine()!.split(separator: " ").map{ Int($0)! }.sorted()
        
        if n == 1 {
            print(numbers[0] * numbers[0])
        } else {
            print(numbers.first! * numbers.last!)
        }
    }
}
