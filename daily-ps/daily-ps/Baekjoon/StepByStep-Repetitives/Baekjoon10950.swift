//
//  Baekjoon10950.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/23.
//

import Foundation

final class Baekjoon10950 {
    func run() {
        solution()
    }
    
    func solution() {
        let n = Int(readLine()!)!
        var numberArray = [[Int]]()
        for index in 0..<n {
            let numbers = readLine()!.split(separator: " ").map { Int($0)! }
            numberArray.append(numbers)
        }
        
        for index in 0..<n {
            let a = numberArray[index][0]
            let b = numberArray[index][1]
            print(a + b)
        }
    }
}
