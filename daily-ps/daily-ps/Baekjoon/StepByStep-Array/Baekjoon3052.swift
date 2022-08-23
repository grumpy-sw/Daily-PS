//
//  Baekjoon3052.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/23.
//

import Foundation

final class Baekjoon3052 {
    func run() {
        solution()
    }
    
    func solution() {
        var numbers: [Int] = []
        var remains: [Int] = []
        for _ in 0..<10 {
            let number = Int(readLine()!)!
            numbers.append(number)
            remains.append(number % 42)
        }
        
        print(removeDuplicatedElements(in: remains).count)
    }
            
    func removeDuplicatedElements(in array: [Int]) -> [Int] {
        let set: Set = Set(array)
        return Array(set)
    }
}
